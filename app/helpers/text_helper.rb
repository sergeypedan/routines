# require Rails.root.join('lib/typography/corrector')

module TextHelper

  def proofread(text)
    Integral::Corrector.proofread(text)
  end

end
