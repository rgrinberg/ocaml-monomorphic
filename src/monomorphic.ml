(*
Copyright (c) 2014 Jacques-Pascal Deplaix <jp.deplaix@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*)

module None = struct
  let (=) () () = ()
  let (<>) () () = ()
  let (<) () () = ()
  let (>) () () = ()
  let (<=) () () = ()
  let (>=) () () = ()
  let compare () () = ()
  let min () () = ()
  let max () () = ()
end

module type TY = sig
  type t
end

module Make (Ty : TY) = struct
  include Pervasives
end

module Int = Make(struct type t = int end)
module Float = Make(struct type t = float end)

type 'a eq = 'a -> 'a -> bool
module List = struct
  include List
  let mem a ~f xs  = xs |> List.exists (f a)
  let assoc a ~f xs = xs |> List.find (fun (k,_) -> f a k) |> snd
  let mem_assoc a ~f xs = xs |> List.exists (fun (k, _) -> f k a)
end
