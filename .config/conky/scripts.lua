
function conky_format(format, number)
   return string.format(format, conky_parse(number))
end

function extract_num(str)
   return tonumber(string.sub(str, string.find(str, "[0-9]+")))
end

function get_mem()
   file = io.open("/proc/meminfo", "r")

   mem_total = extract_num(file:read())
   mem_free = extract_num(file:read())

   file:read() -- mem_available

   mem_buffers = extract_num(file:read())
   mem_cached = extract_num(file:read())

   while true
   do
      str = file:read()
      if string.sub(str, 1, 12) == "SReclaimable"
      then
         break
      end
   end

   mem_sreclaimable = extract_num(str)
   mem_sunreclaim = extract_num(file:read())

   file:close()

   return mem_total, mem_total - mem_free - mem_buffers - mem_cached - mem_sreclaimable - mem_sunreclaim
end

function conky_real_mem()
   mem_total, mem_used = get_mem()
   mem_used = mem_used / 1024


   if mem_used > 10240
   then
      return string.format("%.1Gf", mem_used / 1024)
   elseif mem_used > 1024
   then
      return string.format("%.2fG", mem_used / 1024)
   else
      return string.format("%.0fM", mem_used)
   end
end

function conky_real_memperc()
   mem_total, mem_used = get_mem()
   mem_perc = (mem_used / mem_total) * 100
   return string.format("%.0f", mem_perc)
end

function conky_ethereum()
   
end
