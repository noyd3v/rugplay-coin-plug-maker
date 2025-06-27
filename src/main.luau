local net = require("@lune/net")
local stdio = require("@lune/stdio")

local api_key = stdio.prompt("text", "hi, please put ur api key here")
local symbol = stdio.prompt("text", "ok now put ur symbol")

local function writeInArrays(text: { string })
	for i, v in text do
		stdio.write(v)
	end
end

local params: net.FetchParams = {
	url = "https://rugplay.com/api/v1/coin/" .. symbol,
	method = "GET",
	headers = {
		["Content-Type"] = "application/json",
		["Authorization"] = "Bearer " .. api_key,
	},
}
local response = net.request(params)
local responseBody = net.jsonDecode(response.body)

--[[print(
	"#Buy "
		.. responseBody["coin"]["name"]
		.. "\n"
		.. " [here]"
		.. `(https://rugplay.com/coin/{responseBody["coin"]["symbol"]}) \n`
		.. "because this message was generated with [this neat little program](https://github.com/noyd3v/rugplay-coin-plug-maker)"
		)]]
writeInArrays({
	"#Buy ",
	responseBody["coin"]["name"],
	" [here]",
	`(https://rugplay.com/coin/{responseBody["coin"]["symbol"]}) \n`,
	"because this message was generated with [this neat little program](https://github.com/noyd3v/rugplay-coin-plug-maker)",
})
