require 'open-uri'
require 'nokogiri'

# �X�N���C�s���O���URL
url = 'http://matome.naver.jp/tech'

charset = nil
html = open(url) do |f|
  charset = f.charset # ������ʂ��擾
  f.read # html��ǂݍ���ŕϐ�html�ɓn��
end

# html���p�[�X(���)���ăI�u�W�F�N�g���쐬
doc = Nokogiri::HTML.parse(html, nil, charset)

doc.xpath('//li[@class="mdTopMTMList01Item"]').each do |node|
  # tilte
  p node.css('h3').inner_text

  # �L���̃T���l�C���摜
  p node.css('img').attribute('src').value

  # �L���̃T���l�C���摜
  p node.css('a').attribute('href').value
end
