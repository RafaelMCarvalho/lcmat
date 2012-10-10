# -*- encoding : utf-8 -*-
require "spec_helper"

describe ContactMailer do
  describe 'contact' do
    before do
      @configuration = FactoryGirl.create :configuration
      @params = {:name => 'Fulano', :email => 'fulano@gmail.com',
                :message => 'Qq coisa'}
    end

    let(:mail) { ContactMailer.contact(@params) }

    it 'guarantee that the receiver is correct' do
      mail.to.should == [@configuration.email]
    end

    it 'guarantee that the sender is correct' do
      mail.from.should == ['lcmat@email.com']
    end

    it 'guarantee that the subject is correct' do
      mail.subject.should == "[Contato] #{@params[:name]}"
    end

    it 'guarantee that all information appears on the email body' do
      mail.body.encoded.should =~ /Nome: #{@params[:name]}/
      mail.body.encoded.should =~ /E-mail: #{@params[:email]}/
      mail.body.encoded.should =~ /Mensagem:\r\n#{@params[:message]}/
    end
  end
end

