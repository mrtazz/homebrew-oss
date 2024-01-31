package main

import (
	"fmt"
	"io/ioutil"
	"os"

	"github.com/alecthomas/kong"
	"gopkg.in/yaml.v3"
)

const version = "0.1.0"

type Formula struct {
	Name    string `yaml:"name"`
	Version string `yaml:"version"`
}

type Config struct {
	Formulae []Formula `yaml:"formulae"`
}

func LoadConfigFromFile(filename string) (Config, error) {
	var c Config
	yamlFile, err := ioutil.ReadFile(filename)
	if err != nil {
		return c, err
	}
	err = yaml.Unmarshal(yamlFile, &c)
	return c, err
}

var (
	flags struct {
		Debug bool `help:"Enable debug mode."`
		Run   struct {
			ConfigFile string `required:"" help:"config file to use"`
		} `cmd:"" help:"write formula files"`
		Version struct {
		} `cmd:"" help:"print version and exit."`
	}
)

func main() {

	ctx := kong.Parse(&flags)
	switch ctx.Command() {
	case "run":
	case "version":
		fmt.Printf(version)
		return
	default:
		fmt.Println("Unknown command: " + ctx.Command())
		os.Exit(1)
	}
}

func run() {

	cfg, err := config.FromFile(flags.Run.ConfigFile)
	if err != nil {
		log.WithFields(log.Fields{
			"error":       err.Error(),
			"config-file": flags.Run.ConfigFile,
		}).Error("failed to parse config")
		os.Exit(1)
	}
}
