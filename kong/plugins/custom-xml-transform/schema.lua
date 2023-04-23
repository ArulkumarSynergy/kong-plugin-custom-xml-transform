local typedefs = require "kong.db.schema.typedefs"


local PLUGIN_NAME = "custom-xml-transform"


local schema = {
  name = PLUGIN_NAME,
  fields = {
    -- the 'fields' array is the top-level entry with fields defined by Kong
    { consumer = typedefs.no_consumer },  -- this plugin cannot be configured on a consumer (typical for auth plugins)
    { protocols = typedefs.protocols_http },
    
    { config = {
        -- The 'config' record is the custom part of the plugin schema
        type = "record",
        fields = {
          -- a standard defined field (typedef), with some customizations
          { node_name = typedefs.header_name {
              required = false } },
          
          { ignore_content_type = typedefs.header_name {
            default = false } },
        },
        entity_checks = {
          -- add some validation rules across fields
          -- the following is silly because it is always true, since they are both required
        },
      },
    },
  },
}

return schema
