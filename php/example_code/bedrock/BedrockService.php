<?php

# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

#snippet-start:[php.example_code.bedrock.service]

namespace Bedrock;

use Aws\Bedrock\BedrockClient;
use Aws\Result;
use AwsUtilities\AWSServiceClass;

/**
 * BedRock Service
 */
class BedrockService extends AWSServiceClass
{
    protected BedrockClient $bedrockClient;

    /**
     * @param array $clientArgs
     */
    public function __construct(array $clientArgs = [])
    {
        $this->bedrockClient = new BedrockClient($clientArgs);
    }

    #snippet-start:[php.example_code.bedrock.service.listFoundationModels]
    public function listFoundationModels(): Result
    {
        return $this->bedrockClient->listFoundationModels();
    }
    #snippet-end:[php.example_code.bedrock.service.listFoundationModels]
}
#snippet-end:[php.example_code.bedrock.service]
