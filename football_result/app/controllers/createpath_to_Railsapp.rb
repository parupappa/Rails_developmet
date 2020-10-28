def create_all_image_name
    all_image_name = []
    Dir.glob("/Users/yokooannosuke/Cording/Rails_developmet/football_result/app/assets/images/*.png").each do |em|
      images_name = File.basename(em)
      all_image_name.push(images_name)
    end
    return  all_image_name
end



def create_default_hassyu(name1)
  default_name = { "アーセナル"=>"Arsenal",  "アストン・ヴィラ"=>"AstonVilla","ブライトン"=>'BrightonandHoveAlbion',
    "バーンリー"=>'Burnley',"チェルシー"=>'Chelsea',"クリスタルパレス"=>'CrystalPalace',"エバートン"=>'Everton',"フラム"=>'Fulham',"リーズ"=>'LeedsUnited',
    "レスター"=>'LeicesterCity',"リバプール"=>'Liverpool',"マンチェスターシティ"=>'ManchesterCity',"マンチェスターユナテッド"=>'ManchesterUnited',"ニューカッスル"=>'NewcastleUnited',
    "シェフィールド"=>'SheffieldUnited', "サウサウプトン"=>'Southampton', "トッテナム"=>'TottenhamHotspur',
    "ウェストブロムウィッチ"=>'WestBromwichAlbion',"ウェストハム"=>'WestHamUnited',"ウォルバーハンプトン"=>'WolverhamptonWanderers'}
  default_hassyu = default_name.find{|key,value| key == name1 }
  return default_hassyu
end

def create_other_hassyu(name2)
  other_name = {"アストン・ヴィラ"=>"AstonVilla","アストンヴィラ"=>"AstonVilla","フルアム"=>'Fulham',"マンチェスターC"=>'ManchesterCity',
    "マンC"=>'ManchesterCity',"マンシティ"=>'ManchesterCity',"マンU"=>"ManchesterUnited","マンチェスターU"=>"ManchesterUnited",
    "シェフィールドU"=>'SheffieldUnited', "スパーズ"=>'TottenhamHotspur',"WBA"=>'WestBromwichAlbion',
    "ウエストハム" =>'WestHamUnited',"ウェストブロムウィッチアルビオン"=>'WestBromwichAlbion',"ウルブス"=>'WolverhamptonWanderers', "ウルバーハンプトン"=>'WolverhamptonWanderers'}
  other_hassyu = other_name.find{|key,value| key == name2}
  return other_hassyu
end

def search_team(team_list,name1,name2) #name1 , name2は　フォームから受けとるカタカナのチーム名

  if create_default_hassyu(name1) != nil
    home_png = create_default_hassyu(name1)[1] + ".png"
  else
    if create_other_hassyu(name1) != nil
      home_png = create_other_hassyu(name1)[1] + ".png"
    else
      home_png = nil
      puts("入力したホームチーム名は見つかりませんでした。")
    end
  end

  if create_default_hassyu(name2) != nil
    away_png = create_default_hassyu(name2)[1] + ".png"
  else
    if create_other_hassyu(name2) != nil
      away_png = create_other_hassyu(name2)[1] + ".png"
    else
      away_png = nil
      puts("入力したアウェイチーム名は見つかりませんでした。")
    end
  end

  home_em_png = team_list.find {|item1| item1 == home_png }
  away_em_png = team_list.find {|item2| item2 == away_png }

  return home_em_png , away_em_png

end



puts search_team( create_all_image_name , "マンU", "アセナル" )


