require 'open-uri'
require 'nokogiri'
require 'date'


class Main
	ary = Array.new
	url = 'http://million-arthurs.gamerch.com/'
	charset =nil
	count = 0
	html = open(url) do |f|
		charset = f.charset # 文字種別を取得
		f.read # htmlを読み込んで変数htmlに渡す
	end
	#日付確認(String型に成型)
	day = Time.now
	today = day.mon.to_s+"/"+day.mday.to_s

	# htmlをパース(解析)してオブジェクトを作成
	doc = Nokogiri::HTML.parse(html, nil, charset)

	doc.xpath('//th').each do |th|
		if th.content.include?(today)
			#puts th
			break
		end
		count += 1
	end
	puts count
	#arraylist制作
	data = []
	#doc.xpath("//th[@data-col= '1' or @data-col= '0']|//tr/td[@data-col= '1']").each do |td|
	time = doc.css("th[data-col='0']").text
	date = doc.css("th[data-col]")[count].text
	name = doc.css("td")[count]
	#	ary << td.inner_text
	puts date,time
	#p name
	#end
	puts ary
	
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
