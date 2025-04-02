return {
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
      local jdtls = require("jdtls")
      local root_dir = require("jdtls.setup").find_root({ "pom.xml", "build.gradle" })
      
      local config = {
        cmd = { "jdtls" },
        root_dir = root_dir,
        settings = {
          java = {
            signatureHelp = { enabled = true },
            completion = {
              favoriteStaticMembers = {
                "org.junit.Assert.*",
                "org.junit.jupiter.api.Assertions.*",
              }
            }
          }
        }
      }
      
      jdtls.start_or_attach(config)
    end
  }
}
