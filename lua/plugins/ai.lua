local config = require 'CopilotChat.config'

-- config.providers.gemini = {
--   prepare_input = require 'CopilotChat.config.providers'.copilot.prepare_input,
--   prepare_output = require 'CopilotChat.config.providers'.copilot.prepare_output,
--
--   get_headers = function()
--     local api_key = assert(os.getenv('GEMINI_API_KEY'), 'GEMINI_API_KEY env not set')
--     return {
--       Authorization = 'Bearer ' .. api_key,
--       ['Content-Type'] = 'application/json',
--     }
--   end,
--
--   get_models = function(headers)
--     local response, err = require 'CopilotChat.utils'.curl_get(
--       'https://generativelanguage.googleapis.com/v1beta/openai/models',
--       {
--         headers = headers,
--         json_response = true,
--       }
--     )
--
--     if err then
--       error(err)
--     end
--
--     return vim.tbl_map(function(model)
--       local id = model.id:gsub('^models/', '')
--       return {
--         id = id,
--         name = id,
--         streaming = true,
--         tools = true,
--       }
--     end, response.body.data)
--   end,
--
--   get_url = function()
--     return 'https://generativelanguage.googleapis.com/v1beta/openai/chat/completions'
--   end,
-- }

config.headers = vim.tbl_deep_extend('force', config.headers, {
  user = '👤 You',
  assistant = '🤖 AI',
  tool = '🔧 Tool',
})
config.auto_insert_mode = true
config.trusted_tools = true
config.model = 'claude-haiku-4.5'

config.prompts = vim.tbl_deep_extend('force', config.prompts, {
  JestTest =
  'Write an Unit Test for the attached file. Do not use TestBed, create mocks manually with use of utility `mock<T>`. Write one expect per it block. Use describe block for scenarios.',
  JestTestExtended = {
    prompt = [[
      You are an expert Typescript and Angular developer writing tests in Jest.
      Write an unit test for the attached buffer.

      ### **Requirements for Manual Dependency Injection in Angular Service Tests**

      1.  **Test Structure**:
          *   Create a top-level `describe` block for the service being tested.
          *   Inside this block, declare a variable for the **subject** under test (e.g., `subject`) and variables for each of its constructor dependencies. These will be shared across all tests within the suite.

      2.  **Isolate with `beforeEach`**:
          *   Use a `beforeEach` block to initialize a fresh set of mocks and a new instance of the **subject** before each test (`it` block) runs. This ensures tests are isolated and do not interfere with each other.

      3.  **Mock All Dependencies**:
          *   Inside `beforeEach`, create a mock object for every dependency. A type-safe mocking utility (e.g., `mock<T>`) is highly recommended.
          *   For each mock, provide implementations only for the methods and properties that the **subject** will interact with during the tests.
              *   Use `jest.fn()` to mock methods.
              *   If a method returns an `Observable` or `Promise`, use `jest.fn().mockReturnValue(of(...))` or `jest.fn().mockResolvedValue(...)`.
              *   For dependencies that are injected but whose methods are not called in the current test suite, an empty mock object (`mock<DependencyType>({})`) is sufficient.

      4.  **Instantiate the Subject**:
          *   At the end of the `beforeEach` block, create a new instance of the service using the `new` keyword.
          *   Pass the previously created mock dependencies to the constructor in the exact order they are declared in the service's class definition.
          *   Assign this new instance to the `subject` variable declared in step 1.

      5. **Writing assertions**:
          *  Every it block constains only one expect keyword.
          *  Start every describe block with 'while' keyword describing intent.
          *  Start every it block with 'should' keyword describing behavior.
    ]]
  }
})
