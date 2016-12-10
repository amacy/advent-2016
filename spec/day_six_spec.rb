require "pry"
require_relative "../lib/day_six"

RSpec.describe DaySix do
  describe "solve_part_one" do
    EXAMPLE_MESSAGES = %w[
      eedadn drvtee eandsr raavrd atevrs tsrnev sdttsa rasrtv nssdts ntnada svetve tesnvt vntsnd vrdear dvrsen enarar
    ]
    REAL_MESSAGES = %w[
      ciglthza yoqarfik rcjoirth vlxkrdxh xjowcwsp cufrbndk qohzgsgw bpdtsvgo rcrvqkkc btxvplse qlfyltfb cobghdqs
      ruseyuvp yqqzxjaa pvhrtrnt mlthveen muuwmbwa libbgkep fiiilzus cdcidhzp ayadspsu uaddwqoj hqzqkrty zijzbisy
      phjqbbdl mpqggfew asflznfc zmjrsxpj hsuvqnqf cfnafevn pyotikpr zbpyuuwm kobzhfjl ixzhdvlt kaocobts zvibydrv
      apmgptcz xwlmhenu kxejeclq hxoouxor rlytjgev qaftppcw sozxfiaf sudsdedx dfkcuabm qztpvgtk bkifclzk esoukwnn
      zrhtjxfe oqgzifhj afksfxxd jkdlwctq dasojhxp rrztjdvp dvmkvwya bsclbdrg ndemfsnm qbjidkwk jfaknqge ncrjolpa
      eavqddsb fvkpfxvq owpgmxxq caqrcygs pzxjqtkx rfidiweg rgtptfhe micnjcfu rioxefts dfjjzicj igufreah nnckuapd
      qyplzxir eehaooyc hyemlbxj dofcvydz vtawodxn touyoazv wewxcdms znkjkkzk uggdhekb thupqlws wdvhiubm btrepird
      gvrbxkxi rthlkmvv cjtullwl vmkpxoae nbfixmdm rgnboojf yjwvqjoi sovfwfle splhpmdc ukrxycoh cmvraazt bgtchynm
      jnfuaqkf ftykvlwj opdnkczz kqhhzujo muiungmu odaeittq wejyeoub jvswquyv jggxtiww wsmofcyd pwdqpgeu hpasgtmb
      uzuqrore uvdwjukh kllvnmmb tnvrgpzw qlxxmlgm mfgwrbyd ayznopno stwjwhky gtuaxzam lhmfvqds hpnzfzxo iqtgmkwo
      bxujgszt gyzohrdt bhztojgo tsarhlfg qqscnlun hwlpqkqy mtnljxol mpawbuno kcqvkqej pxpdjbph puirebop ajwbmrou
      ejiotuyf louuuuxk ahcupbdu ldrpjivl djomgaim bzlgspmx ghpatdat mrlpuuyh egjedkpf rzmcyjda vgbjlcyg wthvhkph
      fdlxcbct ezsxwsic xlutfokp kuijsrqx jnohboeb ctjldrui spupdgjq mivcwktm xyijgstm ggvizras ztjdrhrb fygyqytc
      jsovebqw zncmphql pukihcxi zmnnezwz tqgwstto rjzwpkhu lqlhsicv qfyjbdvn ttwzazxv pspwtimo xzifzvzf aeoiucal
      dhrlcgzg ivbwwigg fcpawbgz pqnqinhq lgruulnt onztvlov gqgbmjcg kgyxicin nulhlkgc kwsnyzjz fljmomjb xvfccjya
      iuciyahi ljdgrzfa drhambmn umxxkqka rndggbcm nsmbzgql pjgyzfko nzgymqck seherqqv yxdkxbtk nxjglvbk euzflpte
      qlakodrw vqrhpsqc iqkauagh arrcqgjo gfgpblno zxqktncm yjnevofc qjgrvcqv ohqwyvuv xwtubftc ghudbnos lwoedndr
      xgutnnga iighyswg nkgdamrr kreshqzr ablqwdrr hakjbegx nuyuugrz lcdsifnw wckihgmh cgfsvjpa fbomoplr xwztcusn
      ohmodthy ljuhfvct qupffyxn ncuaujmh uplhopij wjvdorqj hfyturmr xblmcxey fyhlwybx mbumynuq wpnidebo pcrklmpf
      seutsxqn ywnnqzqg txlguard woyrjzfu orcfmres wxbslaqb fhufingt qrbrjppx lyxrtfau edqgfvap mebbyqik dleedxrt
      yrxfqxae oekvohso rzxzyept ilvcojiv pjhxhzsd gxnuxspj vbeenach vlywhlba kqrnhbzb lpfljaup yvynluqu gbznsnnq
      osqfpysd mcnhffeh aqerxnue abkegaao eudapygv darbwthw xejwdhlw vynzctvt biwstalc kzsqmvcd hbdcyegv ajsfvsxn
      brmksdyk bnmeahjx xhtwnmyr vkxhbprx sofgqibe hgemjffe jdseaxdd bbfaxhcc ayersfjt vnalfjvy iyjmtgld axcjswrp
      obqbizpj rkvpeojc tfchzvyu dhfqltvx aqkkjule bcwufnly owlyqvnp qipvcyoe salqmgxz wzwyozsu codtyzns lhelafng
      uewnzwfm pgcvlrid ynbomzur qdavieex ymnmnzpw utenhfar mhjcqghe eyclmhzi puisfeod mofveozx iebupovg oytlqbij
      slhpyyjl zboxauda oxagpdij zxpqkspg irkqkrky lifftiif vdqqlvwl xstoiomi fzkudsvz gmfjpusd hcosmxty kitsrdzw
      izayakjo kapykwmi hxtzkmfw tnsnnpip elcebvca iudyguuu jhobonbt yovjiwxl upmyzsvq xhaqpzmc njibaysb rkoprgow
      wdlmnpub mxjgrmzu errurxlt gemhujjg cbcgrcob lmyrkatt qmtseavz shifsmxk zsaswail ssheeobz aksvnweq jszqzchw
      xkypvfju cqnnzscz xhkxgrui vlodbvdc ppeyrpsn rbddccre eopfklqi btjleqwx lcpcgppo wzvudski gwrflqyw usipjpzr
      igxgaotc erwaqplx jjtvaqth tctinuwq udwxxlzi nkadbbfl dqtocshw smfcaozk toisuwgp dwejfpdc tqqafxnn ylternth
      skzzlthb wuhocwff eelmhyvy jvnsmmyn nnjiahum jazijelv fkhspmdu ffbesirt wezjwnei jbxawsdw hdvlrthr ntgbpclv
      nxzyetbp kryhripu ctcrplbs kobfwcva ansotqry riyrlxup xlchmhuz yksoxsku ekpefamp hspemuvk itltvaui ettndixy
      lyxzirdx ncqcctwz yptwyqhi fbxnwacx sppjgzij tdxxjvyo hyzncnol epvbzlhn wrznlybk uusxwhyt bfhviwmb ummdcdrg
      dmmjqqvu guegvocf zfwmysur bdcsogay evvbvrdp jfsamrog jzywepix efhwgpnq kkmzjzgd bmydkmyq tmkdheyo sdczddjb
      vigkzewa jrazwwea cukflwhb pswbylmg eseoutur vaywfwva fnxniiby jabdnbyv ovchozrv uqkrwhqh aeesvmns bdwkmyxi
      qwdmqchk xdqmsory jqqzztkz uxjfnytj fflitpgf keukslzj hkpzabgh uvbtcdtm tnxaynwz lqvcdfho sacornuy raeqaofe
      grgdtbbr wsqczasr xfxiybnj cxiaeyjb gefiyisq mpnxvusy dvrtzysi tgaygtji yihelhej kroxeyks hjxboyoc dzwgvyqf
      tvpjeekd zazbeuhd dcaxclll nbmqzixz wjdoxeyz yvbkbkjj pldnqoiv owmujtak fjikkhnh wfppfrhk kpzcygnq dcaoktwq
      kpjilmwj mkdxnnbx wcnpwpbg yvydvmkq pqgnbwkp aiyyaqlk temgkewh ygqfustj verqqolf nnkckwxj ssrwgsir ovkmaqei
      vnixijll gvmznvhh pbesjjcg ldxvrvis uvhitkpl ctukxymt gjxvjhkw kzujrrkr figlgkfp oevomvom dmsdugov slbmqklm
      qntlnsjz jolwaxbi rtploxoy acltlubd dofzsjqf uacduqbx ydbecxsp zwggxxfn uswhzeal hsbmbsks mnoorjdl gtamtjdn
      srrtnaha flbzzxbr irvjeias qyjixdza wxspfbau bfqeoccc vashswwd cziysnnw xmqogjmx drrrwavx ntfukvru ohvcxdvq
      hgerbhpa ugnpavvp taswsicy myepzfon zkqypnls zyoubcah zitkxwgg cifbsjum qlezejjy yxnzpicg fwxktfxc mhysnvmk
      tcycaggf ayymqveo bzzlnmqf gmnvxgaw guarudey jrspirhi lzkqcwfn qppdnobn pjdqbclk igbakrwf xpnatcse nwpiilca
      okihtgis zwhyhksc zjikwqxw okmuxtab hameegir nowatlfe pdhogzsv rmwuhtbz bfwgvmmd samgfels tlhtsfkz imuygpmq
      cvscjrrg ydypcupe vkwxatyq qbbikeyl xzarejlz rkbvgmfv igjkifpt luxvrbuc lwqthwnf vwglpqjf uicbmcwi ozgbheeb
      gelvdkso ffoqkijm ycsytmod hwisdhoe ixenhkfd iwnfdmgq jnfuyiql fmvtvjuf icvkudcl miwbxqrf cmmdfhes cioqiykt
      vovunjdb bmkovgeh vowaxzmm dbtamvqn znrnewfe ehdsuoae waosdkig tyribhpm
    ]

    it "works for the example input" do
      expect(DaySix.new(EXAMPLE_MESSAGES).solve_part_one).to eq("easter")
    end

    it "returns the correct answer" do
      expect(DaySix.new(REAL_MESSAGES).solve_part_one).to eq("bjosfbce")
    end
  end

  describe "solve_part_two" do
    it "works for the example input" do
      expect(DaySix.new(EXAMPLE_MESSAGES).solve_part_two).to eq("advent")
    end

    it "returns the correct answer" do
      expect(DaySix.new(REAL_MESSAGES).solve_part_two).to eq("veqfxzfx")
    end
  end
end
