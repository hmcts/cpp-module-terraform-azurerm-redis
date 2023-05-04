package test

import (
	"testing"
    "github.com/stretchr/testify/assert"
	"github.com/gruntwork-io/terratest/modules/terraform"

)

func TestTerraformRedis(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../example",
		VarFiles: []string{"terratest.tfvars"},
		Upgrade: true,
	}

	// Defer the destroy to cleanup all created resources
	defer terraform.Destroy(t, terraformOptions)

	// This will init and apply the resources and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Assert inputs with outputs
	outputs_instance_id := terraform.Output(t, terraformOptions, "redis_cache_instance_id")
	outputs_hostname := terraform.Output(t, terraformOptions, "redis_cache_hostname")
	outputs_ssl_port := terraform.Output(t, terraformOptions, "redis_cache_ssl_port")

	assert.Equal(t, "[/subscriptions/8cdb5405-7535-4349-92e9-f52bddc7833a/resourceGroups/rg-lab-cpp-redisterratest/providers/Microsoft.Cache/redis/test-redis]", outputs_instance_id)
	assert.Equal(t, "[test-redis.redis.cache.windows.net]", outputs_hostname)
	assert.Equal(t, "[6380]", outputs_ssl_port)

}
