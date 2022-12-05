function! myada#before() abort 
  let &t_ut=''
  let $PATH='/home/modolo/opt/GNAT/2021/bin:/home/modolo/opt/GNAT/2021/libexec/gnatstudio/als:'.expand($PATH)
  call s:adaconfig()
endfunction

function! myada#after() abort
endfunction

function! s:adaconfig()
  let g:neomake_ada_maker_remove_invalid_entries = 0
  let g:neomake_ada_enabled_makers = ['check']
  let g:neomake_ada_check_maker = {
        \ 'exe': '/home/modolo/opt/GNAT/2021/bin/gprbuild',
        \ 'args': ['-c','-gnatef'],
        \ 'errorformat': '%-G%f:%s:,%f:%l:%c: %m,%f:%l: %m',
        \ }

  let g:neomake_enabled_makers = ['build']
  let g:neomake_build_maker = {
        \ 'exe': '/home/modolo/opt/GNAT/2021/bin/gprbuild',
        \ 'args': ['-gnatef'],
        \ 'errorformat': '%-G%f:%s:,%f:%l:%c: %m,%f:%l: %m',
        \ }

endfunction

