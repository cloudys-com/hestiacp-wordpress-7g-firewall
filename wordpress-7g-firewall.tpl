#=========================================================================#
# Default Web Domain Template                                             #
# DO NOT MODIFY THIS FILE! CHANGES WILL BE LOST WHEN REBUILDING DOMAINS   #
# https://hestiacp.com/docs/server-administration/web-templates.html      #
#=========================================================================#


# 7G FIREWALL - NGINX v1.6
# @ https://perishablepress.com/7g-firewall-nginx/

map $query_string $bad_querystring_7g {
	
	default 0;
	
	"~*([a-z0-9]{2000,})" 1;
	"~*(/|%2f)(:|%3a)(/|%2f)" 2;
	"~*(order(\s|%20)by(\s|%20)1--)" 3;
	"~*(/|%2f)(\*|%2a)(\*|%2a)(/|%2f)" 4;
	"~*(ckfinder|fckeditor|fullclick)" 5;
	"~*(`|<|>|\^|\|\\|0x00|%00|%0d%0a)" 6;
	"~*((.*)header:|(.*)set-cookie:(.*)=)" 7;
	"~*(localhost|127(\.|%2e)0(\.|%2e)0(\.|%2e)1)" 8;
	"~*(cmd|command)(=|%3d)(chdir|mkdir)(.*)(x20)" 9;
	"~*(globals|mosconfig([a-z_]{1,22})|request)(=|\[)" 10;
	"~*(/|%2f)((wp-)?config)((\.|%2e)inc)?((\.|%2e)php)" 11;
	"~*(thumbs?(_editor|open)?|tim(thumbs?)?)((\.|%2e)php)" 12;
	"~*(absolute_|base|root_)(dir|path)(=|%3d)(ftp|https?)" 13;
	"~*(s)?(ftp|inurl|php)(s)?(:(/|%2f|%u2215)(/|%2f|%u2215))" 14;
	"~*(\.|20)(get|the)(_|%5f)(permalink|posts_page_url)(\(|%28)" 15;
	"~*((boot|win)((\.|%2e)ini)|etc(/|%2f)passwd|self(/|%2f)environ)" 16;
	"~*(((/|%2f){3,3})|((\.|%2e){3,3})|((\.|%2e){2,2})(/|%2f|%u2215))" 17;
	"~*(benchmark|char|exec|fopen|function|html)(.*)(\(|%28)(.*)(\)|%29)" 18;
	"~*(php)([0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})" 19;
	"~*(e|%65|%45)(v|%76|%56)(a|%61|%31)(l|%6c|%4c)(.*)(\(|%28)(.*)(\)|%29)" 20;
	"~*(/|%2f)(=|%3d|$&|_mm|cgi(\.|-)|inurl(:|%3a)(/|%2f)|(mod|path)(=|%3d)(\.|%2e))" 21;
	"~*(<|%3c)(.*)(e|%65|%45)(m|%6d|%4d)(b|%62|%42)(e|%65|%45)(d|%64|%44)(.*)(>|%3e)" 22;
	"~*(<|%3c)(.*)(i|%69|%49)(f|%66|%46)(r|%72|%52)(a|%61|%41)(m|%6d|%4d)(e|%65|%45)(.*)(>|%3e)" 23;
	"~*(<|%3c)(.*)(o|%4f|%6f)(b|%62|%42)(j|%4a|%6a)(e|%65|%45)(c|%63|%43)(t|%74|%54)(.*)(>|%3e)" 24;
	"~*(<|%3c)(.*)(s|%73|%53)(c|%63|%43)(r|%72|%52)(i|%69|%49)(p|%70|%50)(t|%74|%54)(.*)(>|%3e)" 25;
	"~*(\+|%2b|%20)(d|%64|%44)(e|%65|%45)(l|%6c|%4c)(e|%65|%45)(t|%74|%54)(e|%65|%45)(\+|%2b|%20)" 26;
	"~*(\+|%2b|%20)(i|%69|%49)(n|%6e|%4e)(s|%73|%53)(e|%65|%45)(r|%72|%52)(t|%74|%54)(\+|%2b|%20)" 27;
	"~*(\+|%2b|%20)(s|%73|%53)(e|%65|%45)(l|%6c|%4c)(e|%65|%45)(c|%63|%43)(t|%74|%54)(\+|%2b|%20)" 28;
	"~*(\+|%2b|%20)(u|%75|%55)(p|%70|%50)(d|%64|%44)(a|%61|%41)(t|%74|%54)(e|%65|%45)(\+|%2b|%20)" 29;
	"~*(\\x00|(\"|%22|\'|%27)?0(\"|%22|\'|%27)?(=|%3d)(\"|%22|\'|%27)?0|cast(\(|%28)0x|or%201(=|%3d)1)" 30;
	"~*(g|%67|%47)(l|%6c|%4c)(o|%6f|%4f)(b|%62|%42)(a|%61|%41)(l|%6c|%4c)(s|%73|%53)(=|\[|%[0-9A-Z]{0,2})" 31;
	"~*(_|%5f)(r|%72|%52)(e|%65|%45)(q|%71|%51)(u|%75|%55)(e|%65|%45)(s|%73|%53)(t|%74|%54)(=|\[|%[0-9A-Z]{2,})" 32;
	"~*(j|%6a|%4a)(a|%61|%41)(v|%76|%56)(a|%61|%31)(s|%73|%53)(c|%63|%43)(r|%72|%52)(i|%69|%49)(p|%70|%50)(t|%74|%54)(:|%3a)(.*)(;|%3b|\)|%29)" 33;
	"~*(b|%62|%42)(a|%61|%41)(s|%73|%53)(e|%65|%45)(6|%36)(4|%34)(_|%5f)(e|%65|%45|d|%64|%44)(e|%65|%45|n|%6e|%4e)(c|%63|%43)(o|%6f|%4f)(d|%64|%44)(e|%65|%45)(.*)(\()(.*)(\))" 34;
	"~*(@copy|\$_(files|get|post)|allow_url_(fopen|include)|auto_prepend_file|blexbot|browsersploit|(c99|php)shell|curl(_exec|test)|disable_functions?|document_root|elastix|encodeuricom|exploit|fclose|fgets|file_put_contents|fputs|fsbuff|fsockopen|gethostbyname|grablogin|hmei7|input_file|open_basedir|outfile|passthru|phpinfo|popen|proc_open|quickbrute|remoteview|root_path|safe_mode|shell_exec|site((.){0,2})copier|sux0r|trojan|user_func_array|wget|xertive)" 35;
	"~*(;|<|>|\'|\"|\)|%0a|%0d|%22|%27|%3c|%3e|%00)(.*)(/\*|alter|base64|benchmark|cast|concat|convert|create|encode|declare|delete|drop|insert|md5|request|script|select|set|union|update)" 36;
	"~*((\+|%2b)(concat|delete|get|select|union)(\+|%2b))" 37;
	"~*(union)(.*)(select)(.*)(\(|%28)" 38;
	"~*(concat|eval)(.*)(\(|%28)" 39;
	
}

map $request_uri $bad_request_7g {
	
	default 0;
	
	"~*(\^|`|<|>|\\|\|)" 1;
	"~*([a-z0-9]{2000,})" 2;
	"~*(=?\\\(\'|%27)/?)(\.)" 3;
	"~*(/)(\*|\"|\'|\.|,|&|&amp;?)/?$" 4;
	"~*(\.)(php)(\()?([0-9]+)(\))?(/)?$" 5;
	"~*(/)(vbulletin|boards|vbforum)(/)?" 6;
	"~*(/)((.*)header:|(.*)set-cookie:(.*)=)" 7;
	"~*(/)(ckfinder|fck|fckeditor|fullclick)" 8;
	"~*(\.(s?ftp-?)config|(s?ftp-?)config\.)" 9;
	"~*(\{0\}|\"?0\"?=\"?0|\(/\(|\.\.\.|\+\+\+|\\\")" 10;
	"~*(thumbs?(_editor|open)?|tim(thumbs?)?)(\.php)" 11;
	"~*(\.|20)(get|the)(_)(permalink|posts_page_url)(\()" 12;
	"~*(///|\?\?|/&&|/\*(.*)\*/|/:/|\\\\|0x00|%00|%0d%0a)" 13;
	"~*(/%7e)(root|ftp|bin|nobody|named|guest|logs|sshd)(/)" 14;
	"~*(/)(etc|var)(/)(hidden|secret|shadow|ninja|passwd|tmp)(/)?$" 15;
	"~*(s)?(ftp|http|inurl|php)(s)?(:(/|%2f|%u2215)(/|%2f|%u2215))" 16;
	"~*(/)(=|\$&?|&?(pws|rk)=0|_mm|_vti_|cgi(\.|-)?|(=|/|;|,)nt\.)" 17;
	"~*(\.)(ds_store|htaccess|htpasswd|init?|mysql-select-db)(/)?$" 18;
	"~*(/)(bin)(/)(cc|chmod|chsh|cpp|echo|id|kill|mail|nasm|perl|ping|ps|python|tclsh)(/)?$" 19;
	"~*(/)(::[0-9999]|%3a%3a[0-9999]|127\.0\.0\.1|localhost|makefile|pingserver|wwwroot)(/)?" 20;
	"~*(\(null\)|\{\$itemURL\}|cAsT\(0x|echo(.*)kae|etc/passwd|eval\(|self/environ|\+union\+all\+select)" 21;
	"~*(/)?j((\s)+)?a((\s)+)?v((\s)+)?a((\s)+)?s((\s)+)?c((\s)+)?r((\s)+)?i((\s)+)?p((\s)+)?t((\s)+)?(%3a|:)" 22;
	"~*(/)(awstats|(c99|php|web)shell|document_root|error_log|listinfo|muieblack|remoteview|site((.){0,2})copier|sqlpatch|sux0r)" 23;
	"~*(/)((php|web)?shell|crossdomain|fileditor|locus7|nstview|php(get|remoteview|writer)|r57|remview|sshphp|storm7|webadmin)(.*)(\.|\()" 24;
	"~*(/)(author-panel|class|database|(db|mysql)-?admin|filemanager|htdocs|httpdocs|https?|mailman|mailto|msoffice|_?php-my-admin(.*)|tmp|undefined|usage|var|vhosts|webmaster|www)(/)" 25;
	"~*(base64_(en|de)code|benchmark|child_terminate|curl_exec|e?chr|eval|function|fwrite|(f|p)open|html|leak|passthru|p?fsockopen|phpinfo|posix_(kill|mkfifo|setpgid|setsid|setuid)|proc_(close|get_status|nice|open|terminate)|(shell_)?exec|system)(.*)(\()(.*)(\))" 26;
	"~*(/)(^$|00.temp00|0day|3index|3xp|70bex?|admin_events|bkht|(php|web)?shell|c99|config(\.)?bak|curltest|db|dompdf|filenetworks|hmei7|index\.php/index\.php/index|jahat|kcrew|keywordspy|libsoft|marg|mobiquo|mysql|nessus|php-?info|racrew|sql|vuln|(web-?|wp-)?(conf\b|config(uration)?)|xertive)(\.php)" 27;
	"~*(\.)(7z|ab4|ace|afm|ashx|aspx?|bash|ba?k?|bin|bz2|cfg|cfml?|cgi|conf\b|config|ctl|dat|db|dist|dll|eml|engine|env|et2|exe|fec|fla|git|hg|inc|ini|inv|jsp|log|lqd|make|mbf|mdb|mmw|mny|module|old|one|orig|out|passwd|pdb|phtml|pl|profile|psd|pst|ptdb|pwd|py|qbb|qdf|rar|rdf|save|sdb|sql|sh|soa|svn|swf|swl|swo|swp|stx|tar|tax|tgz|theme|tls|tmd|wow|xtmpl|ya?ml|zlib)$" 28;
	
}

map $http_user_agent $bad_bot_7g {
	
	default 0;
	
	"~*([a-z0-9]{2000,})" 1;
	"~*(&lt;|%0a|%0d|%27|%3c|%3e|%00|0x00)" 2;
	"~*(ahrefs|alexibot|majestic|mj12bot|rogerbot|facebookexternalhit|amazonbot|Bytespider|Applebot|zoominfobot)" 3;
	"~*((c99|php|web)shell|remoteview|site((.){0,2})copier)" 4;
	"~*(econtext|eolasbot|eventures|liebaofast|nominet|oppo\sa33)" 5;
	"~*(base64_decode|bin/bash|disconnect|eval|lwp-download|unserialize|\\\x22)" 6;
	"~*(acapbot|acoonbot|asterias|attackbot|backdorbot|becomebot|binlar|blackwidow|blekkobot|blexbot|blowfish|bullseye|bunnys|butterfly|careerbot|casper|checkpriv|cheesebot|cherrypick|chinaclaw|choppy|clshttp|cmsworld|copernic|copyrightcheck|cosmos|crescent|cy_cho|datacha|demon|diavol|discobot|dittospyder|dotbot|dotnetdotcom|dumbot|emailcollector|emailsiphon|emailwolf|extract|eyenetie|feedfinder|flaming|flashget|flicky|foobot|g00g1e|getright|gigabot|go-ahead-got|gozilla|grabnet|grafula|harvest|heritrix|httrack|icarus6j|jetbot|jetcar|jikespider|kmccrew|leechftp|libweb|linkextractor|linkscan|linkwalker|loader|masscan|miner|mechanize|morfeus|moveoverbot|netmechanic|netspider|nicerspro|nikto|ninja|nutch|octopus|pagegrabber|petalbot|planetwork|postrank|proximic|purebot|pycurl|python|queryn|queryseeker|radian6|radiation|realdownload|scooter|seekerspider|semalt|siclab|sindice|sistrix|sitebot|siteexplorer|sitesnagger|skygrid|smartdownload|snoopy|sosospider|spankbot|spbot|sqlmap|stackrambler|stripper|sucker|surftbot|sux0r|suzukacz|suzuran|takeout|teleport|telesoft|true_robots|turingos|turnit|vampire|vikspider|voideye|webleacher|webreaper|webstripper|webvac|webviewer|webwhacker|winhttp|wwwoffle|woxbot|xaldon|xxxyy|yamanalab|yioopbot|youda|zeus|zmeu|zune|zyborg)" 7;
	
}

map $http_referer $bad_referer_7g {
	
	default 0;
	
	"~*(semalt\.com|todaperfeita)" 1;
	"~*(order(\s|%20)by(\s|%20)1--)" 2;
	"~*(blue\spill|cocaine|ejaculat|erectile|erections|hoodia|huronriveracres|impotence|levitra|libido|lipitor|phentermin|pro[sz]ac|sandyauer|tramadol|troyhamby|ultram|unicauca|valium|viagra|vicodin|xanax|ypxaieo)" 3;
	
}

map $request_method $not_allowed_method_7g {
	
	default 0;
	
	"~*^(connect)" 1;
	"~*^(debug)" 2;
	"~*^(move)" 3;
	"~*^(trace)" 4;
	"~*^(track)" 5;
	
}

server {


# 7G FIREWALL - NGINX v1.6
# @ https://perishablepress.com/7g-firewall-nginx/

set $7g_reason "";
set $7g_drop_bad_bot 0;
set $7g_drop_bad_referer 0;
set $7g_drop_bad_query_string 0;
set $7g_drop_bad_request 0;
set $7g_drop_bad_method 0;
set $7g_drop 0;

if ($bad_bot_7g) {

	set $7g_reason "${7g_reason}:bad_bot_${bad_bot_7g}:"; 
	set $7g_drop_bad_bot 1;

}

if ($bad_referer_7g) {

	set $7g_reason "${7g_reason}:bad_referer_${bad_referer_7g}:"; 
	set $7g_drop_bad_referer 1;

}

if ($bad_querystring_7g) {

	set $7g_reason "${7g_reason}:bad_querystring_${bad_querystring_7g}:"; 
	set $7g_drop_bad_query_string 1;

}

if ($bad_request_7g) {

	set $7g_reason "${7g_reason}:bad_request_${bad_request_7g}:"; 
	set $7g_drop_bad_request 1;

}

if ($not_allowed_method_7g) {

	set $7g_reason "${7g_reason}:not_allowed_method_${not_allowed_method_7g}:"; 
	set $7g_drop_bad_method 2;

}

if ($7g_drop_bad_bot) {

	set $args "${7g_reason}";
	set $7g_drop 1;

}

if ($7g_drop_bad_referer) {

	set $args "${7g_reason}";
	set $7g_drop 1;

}

if ($7g_drop_bad_query_string) {

	set $args "${7g_reason}";
	set $7g_drop 1;

}

if ($7g_drop_bad_request) {

	set $args "${7g_reason}";
	set $7g_drop 1;

}

if ($7g_drop_bad_method) {

	set $args "${7g_reason}";
	set $7g_drop 2;

}

if ($7g_drop = 1) {

	return 403;

}

if ($7g_drop = 2) {

	return 405;

}

	listen      %ip%:%web_port%;
	server_name %domain_idn% %alias_idn%;
	root        %docroot%;
	index       index.php index.html index.htm;
	access_log  /var/log/nginx/domains/%domain%.log combined;
	access_log  /var/log/nginx/domains/%domain%.bytes bytes;
	error_log   /var/log/nginx/domains/%domain%.error.log error;

	include %home%/%user%/conf/web/%domain%/nginx.forcessl.conf*;

	location = /favicon.ico {
		log_not_found off;
		access_log off;
	}

	location = /robots.txt {
		try_files $uri $uri/ /index.php?$args;
		log_not_found off;
		access_log off;
	}

	location ~ /\.(?!well-known\/) {
		deny all;
		return 404;
	}

	location / {
		try_files $uri $uri/ /index.php?$args;

		location ~* ^.+\.(ogg|ogv|svg|svgz|swf|eot|otf|woff|woff2|mov|mp3|mp4|webm|flv|ttf|rss|atom|jpg|jpeg|gif|png|webp|ico|bmp|mid|midi|wav|rtf|css|js|jar)$ {
			expires 30d;
			fastcgi_hide_header "Set-Cookie";
		}

		location ~* /(?:uploads|files)/.*.php$ {
			deny all;
			return 404;
		}

		location ~ [^/]\.php(/|$) {
			try_files $uri =404;

			include /etc/nginx/fastcgi_params;

			fastcgi_index index.php;
			fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;

			fastcgi_pass %backend_lsnr%;

			include %home%/%user%/conf/web/%domain%/nginx.fastcgi_cache.conf*;

			if ($request_uri ~* "/wp-admin/|/wp-json/|wp-.*.php|xmlrpc.php|index.php|/store.*|/cart.*|/my-account.*|/checkout.*") {
				set $no_cache 1;
			}

			if ($http_cookie ~* "comment_author|wordpress_[a-f0-9]+|wp-postpass|wordpress_no_cache|wordpress_logged_in|woocommerce_items_in_cart|woocommerce_cart_hash|PHPSESSID") {
				set $no_cache 1;
			}
		}
	}

	location /error/ {
		alias %home%/%user%/web/%domain%/document_errors/;
	}

	location /vstats/ {
		alias   %home%/%user%/web/%domain%/stats/;
		include %home%/%user%/web/%domain%/stats/auth.conf*;
	}

	include /etc/nginx/conf.d/phpmyadmin.inc*;
	include /etc/nginx/conf.d/phppgadmin.inc*;
	include %home%/%user%/conf/web/%domain%/nginx.conf_*;
}
