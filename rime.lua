-- encoding: utf-8

exe_processor = require("exe") -- 网页启动器
unicode_translator = require("unicode_translator") -- 在Rime輸入任意Unicode字符
-- rime.lua
function single_char_filter(input, env)
  on = env.engine.context:get_option("single_char")
  for cand in input:iter() do
    if not on or utf8.len(cand.text) == 1 then
      yield(cand)
    end
  end
end
