" yuttie/comfortable-motion.vim config

" mouse support
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(10)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-10)<CR>
