dataSource {
	pooled = true
	driverClassName = "org.postgresql.Driver"
	username = "postgres"
	password = "postgres" //postgres
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='com.opensymphony.oscache.hibernate.OSCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			//dbCreate = "update" // one of 'create', 'create-drop','update'
			url = "jdbc:postgresql://localhost/monytel"
		}
	}
	test {
		dataSource {
			//dbCreate = "update"
			url = "jdbc:postgresql://localhost/monytel"
		}
	}
	production {
		dataSource {
			url = "jdbc:postgresql://localhost/monytel"
		}
	}
}