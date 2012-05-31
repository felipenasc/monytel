// locations to search for config files that get merged into the main config
// config files can either be Java properties files or ConfigSlurper scripts

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if(System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.types = [ html: ['text/html','application/xhtml+xml'],
                      // xml: ['text/xml', 'application/xml'],
                      text: 'text-plain',
                      js: 'text/javascript',
                      rss: 'application/rss+xml',
                      atom: 'application/atom+xml',
                      css: 'text/css',
                      csv: 'text/csv',
                      all: '*/*',
                      json: ['application/json','text/json'],
                      form: 'application/x-www-form-urlencoded',
                      multipartForm: 'multipart/form-data'
                    ]
// The default codec used to encode data with ${}
grails.views.default.codec="none" // none, html, base64
grails.views.gsp.encoding="UTF-8"
grails.converters.encoding="UTF-8"

// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true

// set per-environment serverURL stem for creating absolute links

environments {
   development {
       web.app.context.path="monytel/"
       fcked.upload.dir = "webmedia/"
       fcked.web.file.path = "webmedia/"
   }
   test {
       web.app.context.path = "monytel/"
       fcked.upload.dir = "webmedia/"
       fcked.web.file.path = "webmedia/"
   }
   production {
       web.app.context.path = "monytel/"
       fcked.upload.dir = "webmedia/"
       fcked.web.file.path = "webmedia/"
       grails.serverURL = "http://www.monytel.com.br"
   }
}
// log4j configuration
log4j {
	appender.fout='org.apache.log4j.RollingFileAppender'
	appender."fout.File"='monytel.log'
	appender."fout.MaxFileSize"='900KB'
	appender."fout.MaxBackupIndex"='10'
	appender."fout.layout"='org.apache.log4j.PatternLayout'
	appender."fout.layout.ConversionPattern"='%d{DATE} %p %t %c - %m%n'

	rootLogger="error,fout"
	logger {
		grails="info,fout"
		org {
			codehaus.groovy.grails.web.servlet="info,fout"  //  controllers
			codehaus.groovy.grails.web.pages="info,fout" //  GSP
			codehaus.groovy.grails.web.sitemesh="info,fout" //  layouts
			codehaus.groovy.grails."web.mapping.filter"="info,fout" // URL mapping
			codehaus.groovy.grails."web.mapping"="info,fout" // URL mapping
			codehaus.groovy.grails.commons="info,fout" // core / classloading
			codehaus.groovy.grails.plugins="info,fout" // plugins
			codehaus.groovy.grails.orm.hibernate="info,fout" // hibernate integration
			springframework="off,fout"
			hibernate="off,fout"
		}
	}
	additivity."default" = false
	additivity {
		grails=false
		org {
			codehaus.groovy.grails=false
			springframework=false
			hibernate=false
		}
	}
}

