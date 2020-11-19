class TNSR < Oxidized::Model
  #tnsr from NetGate

  prompt /\w+#/
  comment "! "

  cmd :all do |cfg|
    cfg.cut_both
  end

  cmd :secret do |cfg|
    cfg.gsub! /(\s+<user-password>).+?(<\/user-password>)/, '\\1<password hidden>\\2'
    cfg.gsub! /(\s+<psk>).+?(<\/psk>)/, '\\1<psk hidden>\\2'
    cfg
  end

  cmd 'show configuration running' do |cfg|
    cfg
  end

  cfg :ssh do
    pre_logout 'exit'
  end
end
