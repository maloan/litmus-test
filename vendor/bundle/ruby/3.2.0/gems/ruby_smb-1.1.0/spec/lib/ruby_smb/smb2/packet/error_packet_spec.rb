require 'spec_helper'

RSpec.describe RubySMB::SMB2::Packet::ErrorPacket do
  subject(:packet) { described_class.new }

  it { is_expected.to respond_to :smb2_header }
  it { is_expected.to respond_to :structure_size }
  it { is_expected.to respond_to :error_data }

  describe '#smb2_header' do
    subject(:header) { packet.smb2_header }

    it 'is a standard SMB2 Header' do
      expect(header).to be_a RubySMB::SMB2::SMB2Header
    end
  end

  describe '#structure_size' do
    it 'should be a 16-bit unsigned integer' do
      expect(packet.structure_size).to be_a BinData::Uint16le
    end

    it 'should be 9 by default' do
      expect(packet.structure_size).to eq 9
    end
  end

  describe '#error_context_count' do
    it 'should be a 8-bit unsigned integer' do
      expect(packet.error_context_count).to be_a BinData::Uint8
    end
  end

  describe '#byte_count' do
    it 'should be a 32-bit unsigned integer' do
      expect(packet.byte_count).to be_a BinData::Uint32le
    end
  end

  describe '#error_data' do
    it 'should be a String' do
      expect(packet.error_data).to be_a BinData::String
    end

    it 'should read #byte_count bytes' do
      packet.error_data = 'test'
      packet.byte_count = 3
      expect(described_class.read(packet.to_binary_s).error_data.size).to eq 3
    end
  end

  describe '#valid?' do
    before :example do
      packet.original_command = RubySMB::SMB2::Commands::LOGOFF
      packet.smb2_header.command = RubySMB::SMB2::Commands::LOGOFF
    end

    it 'returns true if the packet protocol ID and header command are valid' do
      expect(packet).to be_valid
    end

    it 'returns false if the packet protocol ID is wrong' do
      packet.smb2_header.protocol = RubySMB::SMB1::SMB_PROTOCOL_ID
      expect(packet).to_not be_valid
    end

    it 'returns false if the packet header command is wrong' do
      packet.smb2_header.command = RubySMB::SMB2::Commands::NEGOTIATE
      expect(packet).to_not be_valid
    end

    it 'returns false if the packet #structure_size is wrong' do
      packet.structure_size = 10
      expect(packet).to_not be_valid
    end
  end
end

