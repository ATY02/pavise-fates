require 'yaml'

NAMES = [
  "Ready",
  "Idle (Normal)",
  "Pre-Battle (3)",
  "Idle (Dying)",
  "Run",
  "Backstep",
  "Forward Step",
  "Attack 1",
  "Attack 2",
  "Attack T",
  "Attack S",
  "Attack C",
  "Attack F",
  "Shoot",
  "Shoot C",
  "Evasion",
  "Dmg None",
  "Dmg Mid",
  "Dmg High",
  "Die",
  "Start",
  "Win",
  "Charge",
  "Discharge",
  "Cheer",
  "Attack D",
  "Attack DC",
  "Deform",
  "Sing",
  "Shoot D",
  "Shoot DC",
  "Pre-Battle (6)",
  "Standing",
  "Walking",
  "Small Step (Right)",
  "Large Step (Right)",
  "Small Step (Left)",
  "Large Step (Left)",
  "Talk 1",
  "Talk 2",
  "Nodding",
  "Shaking Head",
  "Looking Back",
  "Looking Forward",
  "Looking Down",
  "Falling into Valley",
  "Falling Down",
  "Looking Around",
  "Jumping Down",
  "Landing",
  "Grand Gesture",
  "Worrying",
  "Surprised",
  "Retreating",
  "Standing Up",
  "Arguing",
  "Looking Up",
  "Bathing 1",
  "Sit Down on Chair",
  "Sleeping",
  "Sitting and Talking 1",
  "Tiring 1",
  "Tiring 2",
  "Tiring 3",
  "Blown Away",
  "Peering 1",
  "Peering 2",
  "Peering 3",
  "Sitting Down on Chair",
  "Standing from Chair",
  "Rising from the Dead",
  "Rising from Sleep",
  "Sleeping to Sitting",
  "Lying Down to Vertical Back",
  "Talking with Vertical Back",
  "While Corrin is Touching Face 1",
  "Standing after Corrin Touches Face",
  "Collapsing",
  "Flustered",
  "Flustered 2",
  "武器を突き出す",
  "武器を戻す",
  "半身起き悩み",
  "半身起き驚き",
  "半身起き驚き留まる",
  "深呼吸",
  "回転",
  "呪文を唱える",
  "跪く",
  "背中を叩く",
  "叩かれてのけぞる",
  "庇う",
  "馬移動1",
  "座って話す2",
  "慌て留まる",
  "ベッドに座る1",
  "よろける",
  "構える",
  "ベッドに座る2",
  "腕を掲げる",
  "慌て上半身上げ2待機",
  "慌て上半身上げ2",
  "よつんばい",
  "よつんばい→見渡す",
  "怯える",
  "顔を撫でる1",
  "慌て上半身上げ",
  "構え振り向き",
  "歌う1",
  "歌う3",
  "死亡→跪く",
  "歌う2",
  "泣く",
  "叩かれてのけぞる2",
  "ベッドに寝る",
  "入浴苦しむ1",
  "入浴苦しむ2",
  "喜ぶ2",
  "跪くうつむく",
  "首横振り武器持ち",
  "手振り武器持ち",
  "話す武器持ち",
  "掲げ戻す",
  "構えよろける",
  "へたりこむ",
  "喜ぶ",
  "手を持つ",
  "飛ぶ1",
  "飛ぶ受け取る",
  "構え嘆く",
  "戴冠式1",
  "戴冠式2",
  "上昇",
  "倒れる",
  "驚く2",
  "扉につく1",
  "死亡1",
  "庇う2",
  "構え見回す1",
  "戦闘態勢のまま下を向く",
  "構えよろける2",
  "腕を胸に当てる",
  "クラスチェンジ体勢1",
  "クラスチェンジ体勢2",
  "寝返り",
  "横たわる",
  "抱きしめる",
  "強く抱きしめる",
  "雷を受けよろける",
  "谷に落ちる2",
  "顔を撫でる2",
  "跪く頷く",
  "よろけ頷く",
  "上半身起き→倒れ",
  "膝立ち待機",
  "膝立ち叫び",
  "膝立ち叫び2",
  "膝立ち叫び3",
  "横たわる死",
  "横たわる死_待機",
  "横たわる死_待機2",
  "脅され待機",
  "風神弓を前に出す",
  "自刃1",
  "自刃2",
  "自刃3",
  "自刃4",
  "膝立ち待機沈む",
  "聞き耳1",
  "聞き耳2",
  "跪く→立つ",
  "よつんばい→首振り",
  "よつんばい→立つ",
  "よつんばい前を見る",
  "NONE1",
  "よつんばい立ち待機",
  "ショップ用立ち",
  "思い出す",
  "手を持つ2",
  "手を持つ3",
  "手を持つ4",
  "手を持つ5",
  "谷底を覗く",
  "馬と谷に落ちる",
  "攻撃1",
  "攻撃2",
  "跪く待機",
  "リリスに乗る",
  "跪く話す1",
  "跪く話す2",
  "跪く首振り",
  "抱きしめる2",
  "抱きしめる3",
  "抱きしめる4",
  "かがむ",
  "ベッドに座って話す1",
  "手を持つ6",
  "お辞儀",
  "飛び込む",
  "かがむ戻り",
  "ベッドに座って話す2",
  "部分竜化1",
  "部分竜化2",
  "部分竜化3",
  "入浴飛び込む",
  "神託受ける",
  "吹雪の中を歩く",
  "武器を抜く1",
  "武器を抜く2",
  "捉える1",
  "捉える2",
  "囚われる",
  "武器破壊1",
  "武器破壊2",
  "片手を前に出す",
  "片手を前に出して待機",
  "風神弓を掲げる",
  "木に寄りかかり座る",
  "木に寄りかかり座る→待機",
  "木に寄りかかり座る→立つ",
  "立ち_エンディング用",
  "頷く_エンディング用",
  "話す_エンディング用",
  "跪いて抱きかかえる",
  "跪いて抱きかかえる—泣く",
  "切腹死",
  "イベント用吹っ飛びダメージ",
  "イベント用攻撃モーション",
  "威嚇",
  "剣を調べる",
  "花をつける",
  "剣寸止め",
  "剣寸止め待機",
  "剣寸止め戻し",
  "リリス水に潜る1",
  "リリス水に潜る2",
  "リリス気付く",
  "ダメージ落下1",
  "ダメージ落下2",
  "落下中魔法攻撃",
  "座って話す3",
  "武器持ち待機",
  "武器持ち会話1",
  "武器持ち会話2",
  "あたりを見回す2",
  "リリス食事",
  "リリス喜ぶ",
  "店番_いらっしゃい",
  "店番_待機",
  "店番_ありがとう",
  "温泉_会話A1",
  "温泉_会話A2",
  "温泉_会話B1",
  "温泉_会話B2",
  "ポーズ1",
  "NONE2"
]

ASET_BEGIN = "0x04000000\n2015/04/01 14:07:41 t_ozawa\n0x00010000\nPTR2: AnimClipNameTable\nReady\nIdleNormal\nバトル予約(3)\nIdleDying\nRun\nBackStep\nForwardStep\nAttack1\nAttack2\nAttackT\nAttackS\nAttackC\nAttackF\nShoot\nShootC\nEvasion\nDmgNon\nDmgMid\nDmgHig\nDie\nStart\nWin\nCharge\nDischarge\nCheer\nAttackD\nAttackDC\nDeform\nSing\nShootD\nShootDC\nバトル予約(6)\n立ち\n歩き\n足踏み短右\n足踏み長右\n足踏み短左\n足踏み長左\n話す1\n話す2\n大きく頷く\n首を横に振る\n後ろを見る\n後ろを見る→元へ\nうつむく\n谷に落ちる\n落ちていく\nあたりを見回す\n飛び降りる\n着地する\n大げさな手振り\n悩む\n驚く\n後ずさる\n立ち上がる\n主張する\n見上げる\n入浴1\n椅子に座る\n寝る\n座って話す1\n疲れる1\n疲れる2\n疲れる3\n吹き飛ぶ\n覗きこむ1\n覗きこむ2\n覗きこむ3\n椅子に座りだす\n椅子から立つ\n死亡→起き上がる\n寝る→起き上がる\n寝る→座る\n上半身起き上がる\n上半身起き上がり留まる\nカムイ顔を触る1\n触り終えて立つ\n倒れこむ\n慌てる\n慌てる2\n武器を突き出す\n武器を戻す\n半身起き悩み\n半身起き驚き\n半身起き驚き留まる\n深呼吸\n回転\n呪文を唱える\n跪く\n背中を叩く\n叩かれてのけぞる\n庇う\n馬移動1\n座って話す2\n慌て留まる\nベッドに座る1\nよろける\n構える\nベッドに座る2\n腕を掲げる\n慌て上半身上げ2待機\n慌て上半身上げ2\nよつんばい\nよつんばい→見渡す\n怯える\n顔を撫でる1\n慌て上半身上げ\n構え振り向き\n歌う1\n歌う3\n死亡→跪く\n歌う2\n泣く\n叩かれてのけぞる2\nベッドに寝る\n入浴苦しむ1\n入浴苦しむ2\n喜ぶ2\n跪くうつむく\n首横振り武器持ち\n手振り武器持ち\n話す武器持ち\n掲げ戻す\n構えよろける\nへたりこむ\n喜ぶ\n手を持つ\n飛ぶ1\n飛ぶ受け取る\n構え嘆く\n戴冠式1\n戴冠式2\n上昇\n倒れる\n驚く2\n扉につく1\n死亡1\n庇う2\n構え見回す1\n戦闘態勢のまま下を向く\n構えよろける2\n腕を胸に当てる\nクラスチェンジ体勢1\nクラスチェンジ体勢2\n寝返り\n横たわる\n抱きしめる\n強く抱きしめる\n雷を受けよろける\n谷に落ちる2\n顔を撫でる2\n跪く頷く\nよろけ頷く\n上半身起き→倒れ\n膝立ち待機\n膝立ち叫び\n膝立ち叫び2\n膝立ち叫び3\n横たわる死\n横たわる死_待機\n横たわる死_待機2\n脅され待機\n風神弓を前に出す\n自刃1\n自刃2\n自刃3\n自刃4\n膝立ち待機沈む\n聞き耳1\n聞き耳2\n跪く→立つ\nよつんばい→首振り\nよつんばい→立つ\nよつんばい前を見る\n0x00000000\nよつんばい立ち待機\nショップ用立ち\n思い出す\n手を持つ2\n手を持つ3\n手を持つ4\n手を持つ5\n谷底を覗く\n馬と谷に落ちる\n攻撃1\n攻撃2\n跪く待機\nリリスに乗る\n跪く話す1\n跪く話す2\n跪く首振り\n抱きしめる2\n抱きしめる3\n抱きしめる4\nかがむ\nベッドに座って話す1\n手を持つ6\nお辞儀\n飛び込む\nかがむ戻り\nベッドに座って話す2\n部分竜化1\n部分竜化2\n部分竜化3\n入浴飛び込む\n神託受ける\n吹雪の中を歩く\n武器を抜く1\n武器を抜く2\n捉える1\n捉える2\n囚われる\n武器破壊1\n武器破壊2\n片手を前に出す\n片手を前に出して待機\n風神弓を掲げる\n木に寄りかかり座る\n木に寄りかかり座る→待機\n木に寄りかかり座る→立つ\n立ち_エンディング用\n頷く_エンディング用\n話す_エンディング用\n跪いて抱きかかえる\n跪いて抱きかかえる—泣く\n切腹死\nイベント用吹っ飛びダメージ\nイベント用攻撃モーション\n威嚇\n剣を調べる\n花をつける\n剣寸止め\n剣寸止め待機\n剣寸止め戻し\nリリス水に潜る1\nリリス水に潜る2\nリリス気付く\nダメージ落下1\nダメージ落下2\n落下中魔法攻撃\n座って話す3\n武器持ち待機\n武器持ち会話1\n武器持ち会話2\nあたりを見回す2\nリリス食事\nリリス喜ぶ\n店番_いらっしゃい\n店番_待機\n店番_ありがとう\n温泉_会話A1\n温泉_会話A2\n温泉_会話B1\n温泉_会話B2\nポーズ1\n0x00000000\n0x00000000"

GROUPS = []
8.times { |i| GROUPS << NAMES[(i * 32)...((i * 32) + 32)] }

AnimTable = Struct.new('AnimTable', *NAMES)

def unpack_aset(path)
  lines = unpack(path)
  early = lines.shift(261)
  tables = {}
  nameless = 0
  until lines.empty?
    name = nil
    if lines[0][/^PTR2/]
      name = lines.shift[/^PTR2: (.+)$/, 1]
    else
      name = "Unused #{nameless += 1}"
    end
    types = lines.shift[/^0x(\w\w)/, 1].to_i(16).to_s(2).reverse
    anim = AnimTable.new
    tables[name] = anim
    start = 0
    8.times do |t|
      if types[t] == '1'
        lines.shift[/^0x(\w\w)(\w\w)(\w\w)(\w\w)$/]
        flags = ''
        flags << ('%08b' % $1.to_i(16)).reverse
        flags << ('%08b' % $2.to_i(16)).reverse
        flags << ('%08b' % $3.to_i(16)).reverse
        flags << ('%08b' % $4.to_i(16)).reverse
        32.times do |i|
          next unless flags[i] == '1'
          anim.send("#{NAMES[start + i]}=", lines.shift)
        end
      end
      start += 32
    end
  end
  File.open('aset.yml', 'w+') { |f| f.write(YAML.dump(tables)) }
end

def to_line(flags)
  line = '0x'
  line << "%02X" % flags.shift(8).reverse.join.to_i(2) until flags.empty?
  line
end

def pack_aset(outfile)
  yaml = File.open('aset.yml', 'r') { |f| YAML.load(f) }
  out = [*ASET_BEGIN.split("\n")]
  yaml.each_pair do |a,t|
    group_flags = [0] * 32
    groups = [nil] * 8
    GROUPS.each_with_index do |g,i|
      flags = [0] * 32
      flagsies = {}
      32.times { |f| flags[f] = 1 if t.send(g[f]) }
      if flags.any? { |f| f != 0 }
        groups[i] = to_line(flags)
        group_flags[i] = 1
      end
    end
    out << "PTR2: #{a}"
    out << to_line(group_flags)
    GROUPS.each_with_index do |g,i|
      if groups[i]
        out << groups[i]
        g.each do |n|
          next unless value = t.send(n)
          out << value
        end
      end
    end
  end
  pack(out, outfile)
end

require 'securerandom'

HEX_STR = "0x%02X%02X%02X%02X".freeze

def read_short(file)
  file.readbyte | file.readbyte << 8
end
  
def read_long(file)
  file.readbyte | file.readbyte << 8 | file.readbyte << 16 | file.readbyte << 24
end

def unpack(path)
  file = File.open(path, 'r+b')
  fsize = read_long(file)
  data_size = read_long(file)
  pointer_count_1 = read_long(file)
  pointer_count_2 = read_long(file)
  file.read(16)
  data_region = file.read(data_size).unpack('C*')
  ptr1_region = file.read(pointer_count_1 * 4).unpack('C*')
  ptr2_region = file.read(pointer_count_2 * 8).unpack('C*')
  end_region = file.read(fsize - 0x20 - data_size).unpack('C*')
  end_ofs = data_size + ptr1_region.size + ptr2_region.size
  idx = 0
  pointer_1 = {}
  until ptr1_region.empty?
    pointer_1[ptr1_region.shift(4).pack('C*').unpack('L<').first] = idx
    idx += 4
  end
  pointer_2 = {}
  until ptr2_region.empty?
    key = ptr2_region.shift(4).pack('C*').unpack('L<').first
    (pointer_2[key] ||= []) << ptr2_region.shift(4).pack('C*')
                                          .unpack('L<').first + end_ofs
  end
  labels = {}
  idx = end_ofs
  until end_region.empty?
    str = []
    str << end_region.shift until str.last == 0 || end_region.empty?
    sz = str.size
    str.pop
    labels[idx] = str.pack('C*').force_encoding('shift_jis').encode('utf-8')
    idx += sz
  end
  data = {}
  idx = 0
  ptr1s = {}
  until data_region.empty?
    raw = data_region.shift(4)
    ptr = raw.pack('C*').unpack('L<').first
    if pointer_1[idx]
      if ptr < end_ofs
        pid = ptr1s[ptr]
        pid = (ptr1s[ptr] = SecureRandom.uuid) unless pid
        data[idx] = ["POINTER1: #{pid}", :ptr1]
      else
        data[idx] = [ptr, labels[ptr]]
      end
    end
    if (p2 = pointer_2[idx])
      if data[idx]
        data[idx][1] = :ptr3
        data[idx][2] = labels[ptr]
        data[idx][3] = p2
      else
        data[idx] = [ptr, :ptr2, labels[ptr], p2]
      end
    end
    data[idx] = [ptr] unless data[idx]
    idx += 4
  end
  out = []
  data.each_pair do |k,ptr|
    if p = ptr1s[k]
      out << "PTR1: #{p}"
    end
    if ptr[1]
      if ptr[1] == :ptr1
        out << "#{ptr[0]}"
      elsif ptr[1] == :ptr2
        ptr[3].each do |ptr2|
          out << "PTR2: #{labels[ptr2]}"
        end
        if ptr[2]
          out << "#{ptr[2]}"
        else
          out << "#{HEX_STR % [ptr[0]].pack('L<').unpack('CCCC')}"
        end
      elsif ptr[1] == :ptr3
        ptr[3].each do |ptr3|
          out << "PTR2: #{labels[ptr3]}"
        end
        if ptr[0].is_a?(String)
          out << "#{ptr[0]}"
        end
        if ptr[2]
          out << "#{ptr[2]}"
        elsif !ptr[0].is_a?(String)
          out << "#{HEX_STR % [ptr[0]].pack('L<').unpack('CCCC')}"
        end
      else
        out << "#{ptr[1]}"
      end
    else
      out << "#{HEX_STR % [ptr[0]].pack('L<').unpack('CCCC')}"
    end
  end
  out
end

def pack(data, out)
  data_region = []
  labels = []
  end_region = []
  pointer_1 = []
  pointer1_dr = []
  pointer1_lbl = {}
  ptr1s = {}
  pointer_2 = []
  pointer2_labels = []
  other_labels = []
  data.each_with_index do |line,i|
    line.strip!
    if line[/^PTR1: (.+)/]
      ptr1s[$1] = [data_region.size * 4].pack('L<').unpack('C*')
    elsif line[/^POINTER1: (.+)/]
      data_region << line
    elsif line[/^PTR2: (.+)/]
      pointer_2 << [data_region.size * 4, $1]
      pointer2_labels << $1
    elsif line[/^0x(\w+)$/]
      data_region << [$1.to_i(16)].pack('L<').unpack('CCCC').reverse
    else
      other_labels << line
      data_region << line
    end
  end
  labels.concat(pointer2_labels).concat(other_labels)
  label_idx = {}
  label_idx_raw = {}
  labels.uniq!
  end_ofs = data_region.size * 4 + pointer_2.size * 8
  data_region.each { |d| end_ofs += 4 if d.is_a?(String) }
  size = end_ofs
  labels.each_with_index do |label,i|
    real = label.encode('shift_jis').bytes << 0
    label_idx[label] = [size].pack('L<').unpack('C*')
    label_idx_raw[label] = size
    end_region << real
    size += real.size
  end
  pointer_2.sort_by! { |p| p[0] }
  pointer_2.each do |ptr|
    ptr[0] = [ptr[0]].pack('L<').unpack('C*')
    ptr[1] = [label_idx_raw[ptr[1]] - end_ofs].pack('L<').unpack('C*')
  end
  data_region.each_with_index do |d,i|
    if d.is_a?(String) && d[/^POINTER1: (.+)/]
      data_region[i] = ptr1s[$1]
      puts "NULL: #{$1}" unless ptr1s[$1]
      pointer1_dr << i * 4
    elsif (ptr = label_idx[d])
      data_region[i] = ptr
      (pointer1_lbl[d] ||= []) << i * 4
    end
  end
  pointer1_dr.sort!
  pointer_1.concat(pointer1_dr.collect { |i| [i].pack('L<').unpack('C*') })
  ptr1_lbl_sort = []
  pointer1_lbl.each_value { |v| ptr1_lbl_sort << v.sort }
  ptr1_lbl_sort.sort_by! { |v| v[0] }
  ptr1_lbl_sort.flatten!
  pointer_1.concat(ptr1_lbl_sort.collect { |i| [i].pack('L<').unpack('C*') })
  data_region.flatten!
  pointer_1.flatten!
  pointer_2.flatten!
  end_region.flatten!
  header = []
  size = 0x20 + data_region.size + pointer_1.size + pointer_2.size +
         end_region.size
  header.concat([size].pack('L<').unpack('CCCC'))
  header.concat([data_region.size].pack('L<').unpack('CCCC'))
  header.concat([pointer_1.size / 4].pack('L<').unpack('CCCC'))
  header.concat([pointer_2.size / 8].pack('L<').unpack('CCCC'))
  header.concat([0] * 16)
  File.open(out, 'w+b') do |f|
    f.write(header.pack('C*'))
    f.write(data_region.pack('C*'))
    f.write(pointer_1.pack('C*'))
    f.write(pointer_2.pack('C*'))
    f.write(end_region.pack('C*'))
  end
end

case ARGV[0]
when '-u'
  unpack_aset(ARGV[1])
when '-p'
  pack_aset(ARGV[1])
else
  puts 'Fire Emblem Aset Extractor v1.0'
  puts
  puts 'USAGE:'
  puts '  unpack: aset_extract.rb -u IN'
  puts '  pack:   aset_extract.rb -p OUT'
  puts
  puts '  A file will unpack to aset.yml. Edit said file freely, then'
  puts '  repack it. You\'re done.'
end
