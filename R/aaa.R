httr::user_agent(
  sprintf(
    "sourcehut package v%s: (<%s>)",
    utils::packageVersion("sourcehut"),
    utils::packageDescription("sourcehut")[["URL"]]
  )
) -> .SOURCEHUT_UA