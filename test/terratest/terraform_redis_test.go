package test

import (
	"testing"
    "github.com/stretchr/testify/assert"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"fmt"
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
	assert.Equal(t, "[]", outputs_instance_id)
	assert.Equal(t, "[]", outputs_hostname)

	// Verify configurations
	configurations := terraform.OutputListOfObjects(t, terraformOptions, "configurations")
	if len(configurations[0]) == 8 {
		fmt.Println("Info: Configurations list matches")
	} else {
		t.Fatal("Error: Configurations list dont match!")
	}
}