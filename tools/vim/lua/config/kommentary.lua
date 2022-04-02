local status_ok, kommentary_config = pcall(require, "kommentary.config")

if not status_ok then
  error("Unable to load b3nj5m1n/kommentary.config")
  return
end

-- kommentary_config.use_extended_mappings()
