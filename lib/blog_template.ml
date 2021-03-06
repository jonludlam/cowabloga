(*
 * Copyright (c) 2013 Anil Madhavapeddy <anil@recoil.org>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 *)

open Foundation

let post ~title ~author ~date ~content =
  let open Link in
  let title_text, title_uri = title in
  <:html<
    <article>
      $date$
      <h4><a href=$uri:title_uri$>$str:title_text$</a></h4>
      <p><i>By $link author$</i></p>
      $content$
    </article>
  >>

let t ~title ~subtitle ~sidebar ~posts ~copyright () =
  let subtitle =
    match subtitle with
    | None -> <:html<&>>
    | Some s -> <:html<<small>$str:s$</small>&>>
  in
  <:html<
  <div class="row">
    <div class="large-9 columns">
      <h2>$str:title$ $subtitle$</h2>
    </div>
  </div>
  <div class="row">
    <div class="small-12 large-9 columns" role="content">
      $posts$
    </div>
    <aside class="small-6 large-3 columns panel">
      $sidebar$
    </aside>
  </div>
  <footer class="row">
    <div class="large-12 columns">
      <hr />
      <div class="row">
        <div class="large-6 columns">
          <p><small>&copy; Copyright $copyright$</small></p>
        </div>
      </div>
    </div>
  </footer>
  >>
