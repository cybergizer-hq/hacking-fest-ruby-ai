require 'llama_cpp'

module LlamaCpp
  class BaseService
    attr_reader :model

    def initialize()
      @model = LLaMACpp::Model.new(model_path: './../llama.cpp/models/open_llama_7b/pytorch_model-00001-of-00002.bin', params: model_params)
    end

    def generate(input)
      context = LLaMACpp::Context.new(model:, params: context_params)

      LLaMACpp.generate(context, input)
    end

    protected

    def model_params
      LLaMACpp::ModelParams.new
    end

    def context_params
      params = LLaMACpp::ContextParams.new
      params.seed = 100

      params
    end
  end
end
