# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'cni::plugins::enable define' do
  describe 'macvlan' do
    let(:pp) do
      <<-EOS
      cni::plugins::enable { 'macvlan': }
      EOS
    end

    it_behaves_like 'an idempotent resource'

    describe file('/opt/cni/bin/macvlan') do
      it { is_expected.to be_symlink }
      it { is_expected.to be_owned_by 'root' }
      it { is_expected.to be_grouped_into 'root' }
      it { is_expected.to be_linked_to '/opt/cni/plugins/0.8.5/macvlan' }
    end
  end
end