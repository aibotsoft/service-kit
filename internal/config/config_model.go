package config

type Config struct {
	Service Service
	//Logging  Logging
	//Web      Web
}

type Service struct {
	Name        string
	Environment string
	Env         string
	//Logging  Logging
	//Web      Web
}
