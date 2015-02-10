require 'open-uri'
require 'nokogiri'
require 'date'


class Main
	ary = Array.new
	url = 'http://million-arthurs.gamerch.com/'
	charset =nil
		html = open(url) do |f|
		charset = f.charset # 文字種別を取得
		f.read # htmlを読み込んで変数htmlに渡す
		end

		# htmlをパース(解析)してオブジェクトを作成
		doc = Nokogiri::HTML.parse(html, nil, charset)
		doc.xpath("//th[@data-col='1' or @data-col='0']|//tr/td[@data-col='9']").each do |td|
		ary << td.inner_text
		end
	day = Time.now
	#p day.hour
	str = day.hour.to_s
	if(str)
	puts ary
	str = str+":00"
	p ary.index(str)
#	p str.class

	end
end
#url = 'http://www.eiyoukeisan.com/calorie/gramphoto/kudamono/mikan.html'
#charset =nil
#html = open(url) do |f|
#  charset = f.charset # 文字種別を取得
#  f.read # htmlを読み込んで変数htmlに渡す
#end

# htmlをパース(解析)してオブジェクトを作成
#doc = Nokogiri::HTML.parse(html, nil, charset)
#doc.css('table.mikan_table>tr>td>a').each do |a|
#puts a.text
#end
