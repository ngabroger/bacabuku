class BookList {
  String nameBook, penulis, description, price, imageasset;
  List<String> category;
  bool own;
  BookList({
    required this.nameBook,
    required this.penulis,
    required this.description,
    required this.price,
    required this.category,
    required this.imageasset,
    required this.own,
  });
}

var bookCatalog = [
  BookList(
    nameBook: 'Melangkah',
    penulis: 'J.S. Khairen',
    category: ['Persahabatan', 'Petualangan', 'Novel'],
    description:
        'Novel karya J. S Khairen yang berjudul Melangkah bertemakan tentang petualangan di Indonesia. Tidak hanya itu, cerita dalam novel ini juga mengutamakan kisah pahlawan. Berbeda dari karya-karya yang sebelumnya, di novel ini Khairen memberi sedikit imajinasi yang ia tanamkan. Terdapat 36 episode dan 5 babak.',
    price: 'Rp.69.750',
    imageasset: 'images/melangkah.jpg',
    own: true,
  ),
  BookList(
    nameBook: 'One Piece',
    penulis: 'EIICHIRO ODA',
    category: ['Petualangan', 'Komik'],
    description:
        'One Piece adalah sebuah komik seri manga Jepang yang ditulis dan diilustrasikan oleh Eiichiro Oda. Manga ini telah dimuat di majalah Weekly Shōnen Jump milik Shueisha sejak tanggal 22 Juli 1997, dan telah dibundel menjadi 103 volume tankōbon hingga Agustus 2022. Ceritanya mengisahkan petualangan Monkey D. Luffy, seorang anak laki-laki yang memiliki kemampuan tubuh elastis seperti karet setelah memakan Buah Iblis secara tidak disengaja. Luffy bersama kru bajak lautnya, yang dinamakan Bajak Laut Topi Jerami, menjelajahi Grand Line untuk mencari harta karun terbesar di dunia yang dikenal sebagai "One Piece" dalam rangka untuk menjadi Raja Bajak Laut yang berikutnya.',
    price: 'Rp.26.250',
    imageasset: 'images/onepiece.jpg',
    own: false,
  ),
  BookList(
      nameBook: 'One Punch Man 25',
      penulis: 'ONE & YUSUKE MURATA',
      category: ['Petualangan', 'Komik'],
      description:
          'One Punch Man menceritakan tentang Saitama, seseorang yang tidak terlihat mengesankan dan memiliki hobi yang agak unik, yaitu menjadi pahlawan. Untuk mengejar impian masa kecilnya, Saitama berlatih tanpa henti selama tiga tahun, bahkan sampai kehilangan semua rambutnya dalam proses latihannya itu. Sekarang, Saitama sangat kuat, dia bisa mengalahkan musuh mana pun hanya dengan satu pukulan. Saking kuatnya, Saitama tidak memiliki seorang pun yang menandingi kekuatannya sehingga membuatnya merasa sangat bosan.',
      price: 'Rp.25.600',
      imageasset: 'images/onepunchman25.jpg',
      own: false),
  BookList(
      nameBook: 'Five Nights At Freddy',
      penulis: 'Scott Cawthon',
      category: ['Petualangan', 'Novel'],
      description:
          'Five Nights at Freddys fans tidak akan mau ketinggalan kumpulan tiga cerita panjang novel yang mendebarkan ini akan menjaga bahkan pemain paling berani di malam hari Apa yang paling kamu inginkan? Ini adalah pertanyaan yang Oswald, Sarah, dan Millie pikir mereka tahu jawabannya. Oswald mengucapkan selamat musim panas tidak begitu membosanka ...',
      price: 'Rp.144.250',
      imageasset: 'images/fivenight.jpg',
      own: true),
  BookList(
      nameBook: 'The Girl who Fell',
      penulis: 'Axie Oh',
      category: ['Persahabatan', 'Novel'],
      description:
          'Badai mematikan telah merusak tanah kelahiran Mina selama beberapa generasi. Banjir menyapu seluruh desa, sementara perang berdarah dikobarkan untuk memperebutkan sumber daya yang tersisa. Masyarakat di desa Mina memercayai bahwa Dewa Laut mengutuk mereka dengan kematian dan keputusasaan.',
      price: 'Rp.86.250',
      imageasset: 'images/thegirl.jpg',
      own: false),
  BookList(
      nameBook: 'Demon Slayer',
      penulis: 'KOYOHARU GOTOUGE',
      category: ['Petualangan', 'Komik'],
      description:
          'Demon Slayer adalah komik Jepang terkenal karya Koyoharu Gatouge yang sangat terkenal di Jepang. Komik ini kemudian diadaptasi menjadi serial animasi televisi yang sama-sama sukses di kalangan penggemar anime. Serial komik Ini bercerita tentang seorang remaja Tanjiro Kamado yang mengalami insiden naas. Setelah apa yang terjadi dengan keluarganya yang dibantai dan adik perempuannya, Nezuko, berubah menjadi iblis,',
      price: 'Rp.30.000',
      imageasset: 'images/demonslayer.jpg',
      own: false),
  BookList(
      nameBook: 'Senja Di alaska',
      penulis: 'Abellstr25',
      category: ['Persahabatan', 'Novel'],
      description:
          'Akibat perusahaan keluarganya bangkrut, Arka menjadi sasaran ayahnya untuk bersedia menikah dengan keponakan teman bisnisnya yang bisa memberikan suntikan dana. Namun, Arka yang tidak sudi menikah dengan bocah yang baru saja lulus SMA dan bukan tipenya sama sekalilalu ia memilih mengancam adiknya untuk menggantikan dirinya. Menjadi mempelai pria pengganti bukan keinginan Alaska apalagi mempunyai istri disaat ia sudah memiliki kekasih. Lalu bagaimana kehidupan Senja menghadapi seorang Alaska yang dingin dan enggan menerimanya sebagai istri?',
      price: 'Rp.26.250',
      imageasset: 'images/senjadialaska.jpg',
      own: true),
  BookList(
      nameBook: 'Jujutsu Kaisen 5',
      penulis: 'GEGE AKUTAMI',
      category: ['Petualangan', 'Komik'],
      description:
          'Semua orang terkejut ketika mereka mengetahui Itadori masih hidup, tetapi tidak ada waktu untuk reuni yang mengharukan ketika Jujutsu High berada di tengah-tengah persaingan ketat dengan saingan mereka dari Kyoto! Tapi sportifitas yang baik tampaknya tidak ada dalam kartu begitu pihak berwenang memutuskan untuk menghilangkan ancaman Sukuna sekali dan untuk selamanya.',
      price: 'Rp.30.000',
      imageasset: 'images/jujutsukaisen5.jpg',
      own: true),
];
