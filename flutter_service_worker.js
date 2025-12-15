'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "d5955598fda3f071f7c5143a4b5bb253",
".git/config": "8f515972ea4c7d8008254dff971f4b84",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "7b43e8d6a8c4645d42794de9d04a46c7",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "ecd673b5aec66f6e25a5f178c1b57dcd",
".git/logs/refs/heads/gh-pages": "524d16bda513a5a6d9658c90ed938562",
".git/logs/refs/remotes/origin/gh-pages": "57c4317684aa47d0286d0ccbd2fbb201",
".git/objects/02/5b2f6272ad1ce3c531eb1bb0cd8aa2229bc7a9": "0f2c995210786ba9b13aeffff4106847",
".git/objects/03/e300719f588b9a83cbae43fa135768ef7d7250": "914a8830d23e54995778c3b25298360a",
".git/objects/05/6708caca59fe396a2de2723f5e27920972b734": "cd694d98521964c5a001b09a5bc351d7",
".git/objects/07/228c9c0fe6147d7b61656757f95aa5cef487a2": "7dd9e4083099a0158d75701a4b914677",
".git/objects/08/27c17254fd3959af211aaf91a82d3b9a804c2f": "360dc8df65dabbf4e7f858711c46cc09",
".git/objects/08/a8b9b36f9722d6406ef3e9dd94633ccd714ae9": "54d2ed3613c641dd5b350a0abc29200f",
".git/objects/09/1c4f269a16cffa51d9188f1583faaa4882525b": "35b6312630eec5fba67617f8bf6fd384",
".git/objects/09/97810f9b2e13085f186fe2d5e709f2ecf6c3c6": "f35f025b5ecbe67a68d5f635e203fa21",
".git/objects/0a/5d5fe830bc2604bf1d8f31ec1a52a5839517f2": "2d98040ff5f2368255d87dd25a859f68",
".git/objects/0b/c0006635f940a222b573f0aff1152ebe675f73": "324e3d48651bb85c64e1bb97480e3ecb",
".git/objects/0f/1979596b903653e065b971270459ab2c5d73b0": "5e021e0b3c2ea40b428d65df6aa85ddf",
".git/objects/14/de17d6ebc3627def2dfa5e39b4de89d2a747a3": "8e16a058cbf934d4702ad5bd6bfde2a7",
".git/objects/18/81c19a24ac95af91abded02e8e470b81415cb9": "c7ac117357e623c7abd81bede2138291",
".git/objects/1d/e1b4bba431e811bebac52324844e7b9532160e": "add6a64ac441586f47ca1e1d63dcfc4f",
".git/objects/1e/c5cbd4c65252af16f18d39b00dfecb1d4114fd": "ca46a5e561f74d0e4696dc58faf4a384",
".git/objects/21/f5bc49957832ff5407b603d44e302f7f04f0ce": "88bfd2afde64f56836f1ba2dd777bf9f",
".git/objects/27/d0fd03fb1c0d9a467bcffabc0e70cb2a0f7704": "e9d53a8f52831714b8a017dee280c10b",
".git/objects/29/96f48df4bba8bc14c0647962c772ac69aa49f3": "0bf4a30baa2dbf5778b3e5d053deeb49",
".git/objects/2a/c9d0159b096d169a999be00f14cb5e5df0255d": "eff2dcf8896a0b257ea40ff1fe9d8dc3",
".git/objects/2c/b525bcabae06fa00e1b613f94c5e76451234de": "4f6167a4c89fd924fa909880ac9dd589",
".git/objects/2d/8034be06faee1dd36262d57e9e0abcb6d49c94": "f7601879e1910d53ad26413f2ad52e78",
".git/objects/2d/8efa28903315c36744ced0d8678ae2e6cca400": "4ba9814a6fe980fa09e2ede30312432d",
".git/objects/2e/c138d21f54bb92472cbab94b77b6be328730be": "3ad6d7b49538415adef4fda8f2034baf",
".git/objects/30/89afda93c29763042005312a75b31bf366cede": "c990914e150ad39d1aa174f7c0b78efb",
".git/objects/32/0fad7b46a308fa945eae5dd3014bd3f13c6e2b": "698f8a426399f276ba15a663316faa61",
".git/objects/3a/8cda5335b4b2a108123194b84df133bac91b23": "1636ee51263ed072c69e4e3b8d14f339",
".git/objects/43/127e3daa4968d2a689e30de7a6482da2690d9d": "0382a536ea75e07a8178a665c1152fb6",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/47/040989f468dd38d3c2845155595114c64e8f70": "0d5b5fea80145bfcde244ed8b1bdbc78",
".git/objects/48/e9d3a468ec9e957858bf873fafb05380f0506c": "a7b96e28f741762e22311c9e525bcf16",
".git/objects/4a/0d8649b3d7a33178c7cb5b77322b624678303c": "ec4cad7dd63d9742dc8334669e138d43",
".git/objects/4a/df212d9dfeb1f5a93163b2bcc69fc60ec2c676": "1ac1bb4ebdd8696dbde9bd7ae5e0cabb",
".git/objects/4c/1d78db52b84b62fb75a10ce7f4c6d2210bd7df": "07e8eeee0c26e77914c9af87f820e496",
".git/objects/4d/3f841a26c989461bd5bdcd0fc7b95883c0ffa6": "547af8c678f0566edd9fdc1bd8840ec5",
".git/objects/4f/19931bb3cf043202d69d7bcfe5453c2a879ed7": "e57d4387346b808f4d9570f990b9aa24",
".git/objects/4f/2ddc6c36f66a540b543c52a80b3105e12efd45": "e375f99cca334e1cbb689ad87dc60ae2",
".git/objects/51/03e757c71f2abfd2269054a790f775ec61ffa4": "d437b77e41df8fcc0c0e99f143adc093",
".git/objects/51/a46648fa32a65f810dd4313640d8fb219a1827": "168e08e09aa26b0a8fe261d88341cc89",
".git/objects/52/83dcd95abe47dd3c68ac8e39e026b7950e2bea": "88ec084ea215b893a26990093bfdc979",
".git/objects/52/896f461139823daf687cc35421b4042e303fbc": "63a42eee682858c78a1735754a5479b4",
".git/objects/55/cad22740c601de93687351cd0babba968d0578": "39014234fab7c6074baa5aeaa87498f4",
".git/objects/58/4b35d8d341cbb96a535ad27e5280e118a28c85": "ea9c89be944766dcb2c76e314e8481c2",
".git/objects/5a/93e18e9012b926bc4ecc87483e959b2fb83b03": "29e89cb047004e58470ca90d16f38514",
".git/objects/5c/0f45cf38c5796581376b6be03b5fe9409d1903": "0be60df2d2a28ca7597cb7dad65ee970",
".git/objects/5f/2ae9dc70f24dce6292a7598cd3136b35c89547": "f0848b2d109ffedb329e21cac1d6503c",
".git/objects/5f/be586fa6e87955c43190dace4a08bdfba7ad2c": "594d2d5fbe2d66d3d3d44e0e61d36687",
".git/objects/60/9a968604c1ad9593d15cc20f7f2d4f6ccc1869": "1dbfdf63f8f8f855681bf9205167dba7",
".git/objects/62/a9cb5143923836fedf6a086ad96e3f8c892ea1": "84ea9137c1a2dce104daea6c31795cb4",
".git/objects/65/f550e7d7e34f5d9df7b268838256187e2fe6d9": "83d1925e062528fd70d5727da7021214",
".git/objects/68/43fddc6aef172d5576ecce56160b1c73bc0f85": "2a91c358adf65703ab820ee54e7aff37",
".git/objects/69/35c8cf93b5e633d449d5c8859b8b8f6c86fbed": "687d4e1ac8f5a3edd860093f6ad02f83",
".git/objects/69/4570de0b6b690abd141189e320a6f9e14f2dd8": "540abc438b8f6a57c1479944752296f8",
".git/objects/6b/b40422170586fe84460c9dbd8a7e1bb2fbcdbd": "6fb3ddc8813c2a3b8d5d27fd7b79aa25",
".git/objects/6d/79048fa4c9828c6f903e5585e3056c865b1aef": "a8df290e271b31ff58704ab65f874c7f",
".git/objects/6f/7661bc79baa113f478e9a717e0c4959a3f3d27": "985be3a6935e9d31febd5205a9e04c4e",
".git/objects/73/9b4a60606651afc53db2956878f2178d713930": "34fb24d411e8679d8be00324739fbaff",
".git/objects/74/041d1502657de4b38ea646088da3ec512a448e": "a6e6c35c4333ca580284b6effd66eae4",
".git/objects/77/bebc289a656ed3cb856af08948893c97d1d59d": "e8cfb4ee8180341dffcd98c7f516c198",
".git/objects/7c/3463b788d022128d17b29072564326f1fd8819": "37fee507a59e935fc85169a822943ba2",
".git/objects/7e/9553d44137f80702157cb04f56ec76c2379374": "591d1f893a6d19ab471ab310423ec2d5",
".git/objects/80/ceb2e71a6a40ce97abe0fec16efff4c47b4464": "f4cc8fc2028a8ab5d461c769a3055a3c",
".git/objects/80/e02b967b878f07ef55fcc233b01cb38bc85505": "76997c069df98a24b33582c0d5edb8f8",
".git/objects/81/0c7ef1f756a62a447ec2ffb5a6f3c34b422612": "f0805e1fee26e2ed3c0ec48ab10f0241",
".git/objects/81/1d45d9f19eadb303915ca54a5e8ac94fd8dee9": "9b741528aaeaf9630c70f69d73343726",
".git/objects/81/8e78c6fb4de77f0eb361d6d3f2d5355bc9c1ea": "7e28d1f23e08f395d80e31d821d00226",
".git/objects/81/b28aec9cae1ba9d9ab7e76b784a86e52ff6870": "a4bd520257c8c8a3fbebabfdec014b65",
".git/objects/85/63aed2175379d2e75ec05ec0373a302730b6ad": "997f96db42b2dde7c208b10d023a5a8e",
".git/objects/85/98179e179cc5593b431cd50ee21936dc3fd8c3": "b8712027ea776239f77258bc0d16c248",
".git/objects/85/d3aee941a7a8c60f2195d65b25da4f0984be5b": "ec5bca19f7da952fc1d5aaba12565492",
".git/objects/87/8dbfdb459165bd6deb483307d54a4a90ab417c": "3ea183080333f3d84895084dd9d32517",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8e/21753cdb204192a414b235db41da6a8446c8b4": "1e467e19cabb5d3d38b8fe200c37479e",
".git/objects/91/5a8747b3de8bb8ae060c1e3a1e7dda84da48ea": "3455904339f635d158ce44a0c3b5f4d6",
".git/objects/92/70ce0aaf9a0056d412528d751db2277278dd46": "8e09160ef1f93ca4349c795036091e2d",
".git/objects/93/b363f37b4951e6c5b9e1932ed169c9928b1e90": "c8d74fb3083c0dc39be8cff78a1d4dd5",
".git/objects/95/3548d4e7f899b541b4b6ffd141401587d7cbac": "64c14ed78abec0099054fc797124a86c",
".git/objects/96/514c4b7b0505da36be4f04b103d85e8d225e6d": "cda2cc6e432ff208066de97fd12c0619",
".git/objects/98/8347965a84c89ce77c6e0cba3de3b1e0ca99c2": "db89cdae349839ee5875d244b47d7d0e",
".git/objects/9a/fab431758188d861f3d2adca24007de0e9f146": "55dd3334b7285dead012e03564d7a64b",
".git/objects/9f/f0825efa2c1782bcaa743df5b97ad9766114f1": "15d76dd40c4d4b4af261eaf8de404823",
".git/objects/a4/94e1b69830dd97299d53d382aef8661749a5c6": "a262cd737cb279d5bb90034976fd90e0",
".git/objects/a6/e1963958e7fd98f63e39e6ad7b8bb41f399f74": "5590bd7abfd2b9f3add9937a763389ec",
".git/objects/a7/3f4b23dde68ce5a05ce4c658ccd690c7f707ec": "ee275830276a88bac752feff80ed6470",
".git/objects/ad/ced61befd6b9d30829511317b07b72e66918a1": "37e7fcca73f0b6930673b256fac467ae",
".git/objects/af/6e5b230b3f6595120ed3f9c0cebc0c80d05964": "4d2b475a29a53ff416f83d5ec1d3baaf",
".git/objects/b2/673c58654322efefd5320e0e4aa168b4eab6f2": "2dcb7832ed7ae97be37a35d56ac40743",
".git/objects/b2/e0184815f63562da615f704ad27e969eedb063": "422e50ea0b11fcd1704e04c50a6e800c",
".git/objects/b3/c77026d482043bfc8e601fce86e8cd698c1c35": "2743aa821f7f61fac144527fc508e499",
".git/objects/b5/3f8e71cef830d6cb0ad7bd5543548097c72939": "eb2ed3b3c35b8c4ddaf236dc1032b99d",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/0efadfd3b29e71449fe720b0d503d3a71e78fc": "1e1acdc2ff3aebde051a6ce6c0c9315c",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/3db8a1c8ed641df12659db0f956678c5ad7c09": "bb59307d87b4ebe5bb5597f01c30497c",
".git/objects/b9/3e39bd49dfaf9e225bb598cd9644f833badd9a": "666b0d595ebbcc37f0c7b61220c18864",
".git/objects/bb/5db311017b33d25136ca1baeee8cabe3f7a0d3": "97aaa3f5bd002c385f88a98e61eb7152",
".git/objects/bc/41b7ac1a48ae9baf761360e31c2f404a501291": "02d3d4edd92cdacc13fec28be3b50215",
".git/objects/bd/5a1fc4c4326b5c4dc246c54d76091b2607e8a0": "733aedc2e2bffb7914800bae3f3b971b",
".git/objects/c3/d2ac6413996109454a0de9ddcf99800ce2b0e8": "3c42718eb4075c34547f1ec2e4e2e8f7",
".git/objects/c5/5e7a0a4896fc0347bfaf402993aabb4d136c91": "7eda99e66ecb7d6a20acaea2eb237c8e",
".git/objects/c7/58fc8c015e333f3c12b7dc9abd0f19be24e409": "e315bbba9ff9ae8d85f7516fb0ee47e3",
".git/objects/c8/3af99da428c63c1f82efdcd11c8d5297bddb04": "144ef6d9a8ff9a753d6e3b9573d5242f",
".git/objects/c9/a6c54bb47d2d4e32dc0694a4ed8defde40d8ba": "b17533b8ef7ab5d4dd498a3bbf106910",
".git/objects/cb/22baeaa263fb3519ef60cf715b987dd98563f7": "7ea539638f9302517ca9f1e11c061398",
".git/objects/cc/916506b4ca6b4c1c2e3e32d0be93e2374f4eb5": "ed3f4952db9e5bef38b5ed50b0208b7a",
".git/objects/d0/95c4331f74b08220724b9bdd7ad930f3c49a50": "5209dc3b3b477c263e70592ec6989167",
".git/objects/d1/77d38f46df9124d05dca32ec34921711e9d0e9": "e45011b08b70b2382a234c4e17270492",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d6/a421c8a5387655d198335936a5e3b7cca8ffba": "7462820b4c7b2799eab2d70ea3dd0aab",
".git/objects/d7/e9c1ed1094a57170c2b8ee61864c16a718aab2": "e2bc09ae2f2eab02063eeb8071c01ee8",
".git/objects/d9/1d88bd593a041f76cc5cf94b1ce7e17fcc76e1": "a8f82ff7d103f005cb71b36fdb04ed28",
".git/objects/d9/5b1d3499b3b3d3989fa2a461151ba2abd92a07": "a072a09ac2efe43c8d49b7356317e52e",
".git/objects/db/53cb72c53f0ba58ce4a0495d376481143eb86e": "d53969b27cfd77ee341b24d7d84c7000",
".git/objects/dd/0711a8407b9254d61c4eb216cf39a2fd828c47": "7ca731558e17eaffa1ee1f46aeb2e835",
".git/objects/dd/4b446a4944d15f2a22b055cf3df9a08089d8ac": "cad6b538a560989464b4d79b1c81ff80",
".git/objects/e0/c2368417759d07b25836e55efb7593e2b30a0d": "62423e1de421827a47485a9c716bd463",
".git/objects/e5/b989a669367547a01e3d8118e9eb7640b7afa7": "bf476c93d98cc5c1cd5e7abe0cb73ffd",
".git/objects/e8/59cf0203ea70b41774ce27466f03094338ea66": "6e1de63ecdbf152536719de03b10eb04",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/f1/22c9fb26fe9ec3d27ed32072d4e1caa585a2cb": "5693b4310db64c4922167d06feb5097b",
".git/objects/f3/3e0726c3581f96c51f862cf61120af36599a32": "afcaefd94c5f13d3da610e0defa27e50",
".git/objects/f3/bcb3193dc1a69c0195dfeb6597f19264e68341": "2c4dd286ef3911239b8554d25116765a",
".git/objects/f4/045d3dbb33dfee32839e4feff347734063cc7d": "28893f5f98128d84d5f9eef4e30dfb6a",
".git/objects/f4/6a5c2e107b21a26d101a3ce2b92c2c7203d8c2": "5572b546ec06e2d5cf19e55895863fef",
".git/objects/f6/e6c75d6f1151eeb165a90f04b4d99effa41e83": "95ea83d65d44e4c524c6d51286406ac8",
".git/objects/f8/524784f42a7023ec007262781733cab21991ec": "0eeda62ecaa9ce0d07ecc7a157f324b3",
".git/objects/fc/1802e23d62f35e889cbe232fd01f7513461a96": "8d1af72664488b7ea07ef60277fd5293",
".git/objects/fd/05cfbc927a4fedcbe4d6d4b62e2c1ed8918f26": "5675c69555d005a1a244cc8ba90a402c",
".git/refs/heads/gh-pages": "ebd021912578a67c7f1a6759a394a757",
".git/refs/remotes/origin/gh-pages": "ebd021912578a67c7f1a6759a394a757",
"assets/AssetManifest.bin": "6fc9e44cb32d38ba749d2111970fe154",
"assets/AssetManifest.bin.json": "4933e0880cc8995b1a92eeb1f4af4008",
"assets/assets/android_icon.png": "038ea15b40a395099451862327ebcfc1",
"assets/assets/css3.png": "b1bd0673d70ccee89e1457bd71554759",
"assets/assets/dart.png": "1a089616e2be1ac7c5188c00225772c8",
"assets/assets/desktop_icon.png": "e0e90a080a776fd1da23f5a249b5ce3c",
"assets/assets/docker.png": "722cafb6c71b44bba6292a603b2e198c",
"assets/assets/facebook.png": "fa74fe1619d75d68df1f0db7c654e39a",
"assets/assets/flutter.png": "abe34b0551ded954f6759cada7807e3e",
"assets/assets/github.png": "7aed3646cbea181a3da85620809e992c",
"assets/assets/html5.png": "9d5b22bfe74ac513d5cd33563908ae71",
"assets/assets/hugo.png": "6c341d7823570ab705c940f1dea993ef",
"assets/assets/instagram.png": "02c7721e097a6bb001d00fa61750bc81",
"assets/assets/ios_icon.png": "4b8039e8a442657c7b9b379322eb2793",
"assets/assets/javascript.png": "ab8e2beca091db2345ff66a5cc432985",
"assets/assets/linkedin.png": "e4d142586676a80b3927d899d3584148",
"assets/assets/Luska_transparency.webp": "1b04adfc2ec70dd2e6cbef3668858e9f",
"assets/assets/my_flutter_avatar.png": "a6fc0bb5fb8f7c50d06b283332eaa57c",
"assets/assets/projects/02.png": "cf8468132005ef5442c5857705e39c40",
"assets/assets/projects/03.png": "9dd85f5710c01486dc5937733a22d9eb",
"assets/assets/projects/04.png": "8e2a233d5e7b9930407e3cccf54b6799",
"assets/assets/projects/05.png": "e2cc840dbaaf91e6acba1d9d44ae502f",
"assets/assets/projects/06.png": "11a36375edc4b5ba6956bdeed286f733",
"assets/assets/projects/1.png": "1f59be4af5fe374b4e3f5f6afdb3a24c",
"assets/assets/projects/pekinczyk_01.jpg": "fd7f270a58d859998cc46046a0e54788",
"assets/assets/projects/pekinczyk_02.jpg": "b6a50ef84e0235a4046784a20d072deb",
"assets/assets/projects/pekinczyk_food_01.jpg": "4d8cc4c31f17b871038a6fb9a58af11f",
"assets/assets/projects/pekinczyk_food_02.jpg": "7e49bb4f4f4b7ce620a62dd0764216be",
"assets/assets/projects/pekinczyk_health_01.jpg": "668c1f6950440f6fbefee4c526007e99",
"assets/assets/projects/pekinczyk_health_02.jpg": "b655dd4518e993376c40dfbf4a4a318c",
"assets/assets/projects/pekinczyk_social_01.jpg": "039e04f715c3a0d076c9104656ab0cf1",
"assets/assets/projects/pekinczyk_social_02.jpg": "fca0241242eb569c377ac3b6eb4bbc84",
"assets/assets/projects/pekinczyk_training_01.jpg": "a5fd4b03e9053184fc020ab1172ce820",
"assets/assets/projects/pekinczyk_training_02.jpg": "98cbd9827d6d96a10aeeeb9861ff0a5f",
"assets/assets/projects/w01.png": "b1256ae160f9170ab36ce78ee7a4dc2d",
"assets/assets/projects/w02.png": "f3168876c62cbf02cb9ff94640383f96",
"assets/assets/projects/w03.jpeg": "81f24b685fd3f214e409fd29217c1235",
"assets/assets/python.png": "e04382338533c6bb0dcfc7a48bf86502",
"assets/assets/telegram.png": "d940cd7b5e7b66510b59785177c6414f",
"assets/assets/web_icon.png": "8867144689b70d099377ee3c4ab1baa0",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "e8808647afdeae04a9f7446bd669f4cd",
"assets/NOTICES": "cee37596380b09b7470129351f3388bb",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "5f72d664707e4d711a1c0c240912cd50",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"flutter_bootstrap.js": "fc0d4f0986b7f21e3009bbb0dd21be78",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "13a595b864f441e2438dca7447e7b4f4",
"/": "13a595b864f441e2438dca7447e7b4f4",
"main.dart.js": "3b58535eca69683b08054242901e7aa8",
"manifest.json": "d8fe34f7ae4c072a77b924e01dac8a50",
"version.json": "9b818ca9511483c901bed1545384376c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
