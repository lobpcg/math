%% File: `k_monograph_en.bst`
%% US English Author-Year BibTeX style for Knyazev (1986) Monograph Translation
%% Compatible with `natbib` and the unified bilingual `k_references.bib` database.

ENTRY
  { address
    address_ru
    author
    author_ru
    booktitle
    booktitle_ru
    chapter
    doi
    edition
    edition_ru
    editor
    editor_ru
    eid
    en_skip
    howpublished
    howpublished_ru
    institution
    institution_ru
    isbn
    issn
    journal
    journal_ru
    key
    key_ru
    langid
    month
    note
    note_ru
    number
    number_ru
    organization
    pages
    publisher
    publisher_ru
    school
    school_ru
    series
    series_ru
    title
    title_ru
    type
    type_ru
    url
    volume
    volume_ru
    year
  }
  {}
  { label extra.label sort.label short.list }

INTEGERS { output.state before.all mid.sentence after.sentence after.block }

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}

STRINGS { s t }

FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
        { add.period$ write$
          newline$
          "\newblock " write$
        }
        { output.state before.all =
            'write$
            { add.period$ " " * write$ }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {fin.entry}
{ add.period$
  write$
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
        'skip$
        { after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}

FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "\emph{" swap$ * "}" * }
  if$
}

INTEGERS { nameptr namesleft numnames }

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{vv~}{ll}{, ff}{, jj}" format.name$ 't :=
      nameptr #1 >
        { namesleft #1 >
            { ", " * t * }
            { s nameptr "{ff }{vv }{ll}{ jj}" format.name$ "others" =
                { " et~al." * }
                { numnames #2 >
                    { ", and " * t * }
                    { " and " * t * }
                  if$
                }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.key}
{ empty$
    { key field.or.null }
    { "" }
  if$
}

FUNCTION {format.authors}
{ author empty$
    { "" }
    { author format.names }
  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }
    { editor format.names
      editor num.names$ #1 >
        { ", eds." * }
        { ", ed." * }
      if$
    }
  if$
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { title }
  if$
}

FUNCTION {format.full.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{vv~}{ll}" format.name$ 't :=
      nameptr #1 >
        { namesleft #1 >
            { ", " * t * }
            { t "others" =
                { " et~al." * }
                { numnames #2 >
                    { ", and " * t * }
                    { " and " * t * }
                  if$
                }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {author.editor.full}
{ author empty$
    { editor empty$
        { key field.or.null }
        { editor format.full.names }
      if$
    }
    { author format.full.names }
  if$
}

FUNCTION {author.full}
{ author empty$
    { key field.or.null }
    { author format.full.names }
  if$
}

FUNCTION {editor.full}
{ editor empty$
    { key field.or.null }
    { editor format.full.names }
  if$
}

FUNCTION {make.full.names}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.full
    { type$ "proceedings" =
        'editor.full
        'author.full
      if$
    }
  if$
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem[" write$
  label write$
  ")" make.full.names duplicate$ short.list =
     { pop$ }
     { * }
   if$
  "]{" * write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
        { t #1 #2 substring$ "--" = not
            { "--" *
              t #2 global.max$ substring$ 't :=
            }
            {   { t #1 #1 substring$ "-" = }
                { "-" *
                  t #2 global.max$ substring$ 't :=
                }
              while$
            }
          if$
        }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
      if$
    }
  while$
}

FUNCTION {format.date}
{ year duplicate$ empty$
    { "empty year in " cite$ * warning$
       pop$ "" }
    'skip$
  if$
  month empty$
    'skip$
    { month " " * swap$ * }
  if$
  extra.label *
}

FUNCTION {format.btitle}
{ title emphasize
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { "vol." volume tie.or.space.connect
      series empty$
        'skip$
        { " of " * series emphasize * }
      if$
      number empty$
        'skip$
        { ", no." number tie.or.space.connect * }
      if$
    }
  if$
}

FUNCTION {format.number.series}
{ volume empty$
    { number empty$
        { series field.or.null }
        { series empty$
            { "no." number tie.or.space.connect }
            { series ", no." * number tie.or.space.connect }
          if$
        }
      if$
    }
    { "" }
  if$
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { edition }
  if$
}

INTEGERS { multiresult }

FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
        { #1 'multiresult := }
        { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
        { "pp." pages n.dashify tie.or.space.connect }
        { "p." pages tie.or.space.connect }
      if$
    }
  if$
}

FUNCTION {format.book.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
        { "pp." pages n.dashify tie.or.space.connect }
        { pages "~pp." * }
      if$
    }
  if$
}

FUNCTION {format.vol.num.pages}
{ volume empty$
    { number empty$
        { "" }
        { "no." number tie.or.space.connect }
      if$
    }
    { "vol." volume tie.or.space.connect
      number empty$
        'skip$
        { ", no." number tie.or.space.connect * }
      if$
    }
  if$
  pages empty$
    'skip$
    { duplicate$ empty$
        { pop$ format.pages }
        { ", " * format.pages * }
      if$
    }
  if$
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    'format.pages
    { type empty$
        { "ch." }
        { type }
      if$
      chapter tie.or.space.connect
      pages empty$
        'skip$
        { ", " * format.pages * }
      if$
    }
  if$
}

FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { editor empty$
        { "In " booktitle emphasize * }
        { "In " booktitle emphasize * " (" * format.editors * ")" * }
      if$
    }
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$ type }
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { "Preprint" }
    'type
  if$
  number empty$
    'skip$
    { number tie.or.space.connect }
  if$
}

FUNCTION {output.doi.or.url}
{ doi empty$
    { url empty$
        'skip$
        { new.block
          "\biburl{" url * "}" * output
        }
      if$
    }
    { new.block
      "\bibdoi{" doi * "}" * output
    }
  if$
}

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  new.block
  format.title "title" output.check
  new.block
  journal emphasize "journal" output.check
  format.vol.num.pages output
  format.date "year" output.check
  new.block
  note output
  output.doi.or.url
  fin.entry
}

FUNCTION {book}
{ output.bibitem
  author empty$
    { editor empty$
        { format.btitle "title" output.check }
        { format.editors output.nonnull
          new.block
          format.btitle "title" output.check
        }
      if$
    }
    { format.authors output.nonnull
      new.block
      format.btitle "title" output.check
      editor empty$
        'skip$
        { " (" format.editors * ")" * output }
      if$
    }
  if$
  format.edition output
  format.bvolume output
  new.block
  format.number.series output
  new.sentence
  publisher output
  address output
  format.date "year" output.check
  format.book.pages output
  new.block
  note output
  output.doi.or.url
  fin.entry
}

FUNCTION {booklet}
{ output.bibitem
  format.authors output
  author format.key output
  new.block
  format.title "title" output.check
  howpublished address new.block.checkb
  howpublished output
  address output
  format.date output
  new.block
  note output
  output.doi.or.url
  fin.entry
}

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check }
    { format.authors output.nonnull }
  if$
  new.block
  format.btitle "title" output.check
  format.edition output
  format.bvolume output
  format.chapter.pages output
  new.block
  format.number.series output
  new.sentence
  publisher output
  address output
  format.date "year" output.check
  new.block
  note output
  output.doi.or.url
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  new.block
  format.title "title" output.check
  new.block
  format.in.ed.booktitle "booktitle" output.check
  format.bvolume output
  format.number.series output
  publisher output
  address output
  format.edition output
  format.date "year" output.check
  format.chapter.pages output
  new.block
  note output
  output.doi.or.url
  fin.entry
}

FUNCTION {inproceedings}
{ incollection }

FUNCTION {conference} { inproceedings }

FUNCTION {manual}
{ output.bibitem
  format.authors output
  author format.key output
  new.block
  format.btitle "title" output.check
  organization address new.block.checkb
  organization output
  address output
  format.edition output
  format.date output
  new.block
  note output
  output.doi.or.url
  fin.entry
}

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  "Master's thesis" format.thesis.type output.nonnull
  school output
  address output
  format.date "year" output.check
  new.block
  note output
  output.doi.or.url
  fin.entry
}

FUNCTION {misc}
{ output.bibitem
  format.authors output
  author format.key output
  title howpublished new.block.checkb
  format.title output
  howpublished new.block.checka
  howpublished output
  address output
  format.date output
  new.block
  note output
  output.doi.or.url
  fin.entry
}

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.btitle "title" output.check
  new.block
  "Ph.D. dissertation" format.thesis.type output.nonnull
  school output
  address output
  format.date "year" output.check
  format.book.pages output
  new.block
  note output
  output.doi.or.url
  fin.entry
}

FUNCTION {proceedings}
{ output.bibitem
  editor empty$
    { organization output }
    { format.editors output.nonnull }
  if$
  new.block
  format.btitle "title" output.check
  format.bvolume output
  format.number.series output
  publisher output
  address output
  format.date "year" output.check
  format.book.pages output
  new.block
  note output
  output.doi.or.url
  fin.entry
}

FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  format.tr.number output.nonnull
  institution output
  address output
  format.date "year" output.check
  format.book.pages output
  new.block
  note output
  output.doi.or.url
  fin.entry
}

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  note "note" output.check
  format.date output
  output.doi.or.url
  fin.entry
}

FUNCTION {default.type} { misc }

MACRO {jan} {"January"}
MACRO {feb} {"February"}
MACRO {mar} {"March"}
MACRO {apr} {"April"}
MACRO {may} {"May"}
MACRO {jun} {"June"}
MACRO {jul} {"July"}
MACRO {aug} {"August"}
MACRO {sep} {"September"}
MACRO {oct} {"October"}
MACRO {nov} {"November"}
MACRO {dec} {"December"}

READ

FUNCTION {sortify}
{ purify$
  "l" change.case$
}

INTEGERS { len }

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}

FUNCTION {format.lab.names}
{ 's :=
  s #1 "{vv~}{ll}" format.name$
  s num.names$ duplicate$
  #3 >
    { pop$
      s #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
        { " et~al." * }
        { ", " * s #2 "{vv~}{ll}" format.name$ * ", et~al." * }
      if$
    }
    { duplicate$ #3 =
        { pop$
          s #3 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
            { ", " * s #2 "{vv~}{ll}" format.name$ * ", et~al." * }
            { ", " * s #2 "{vv~}{ll}" format.name$ * ", and " * s #3 "{vv~}{ll}" format.name$ * }
          if$
        }
        { #2 <
            'skip$
            { s #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
                { " et~al." * }
                { " and " * s #2 "{vv~}{ll}" format.name$ * }
              if$
            }
          if$
        }
      if$
    }
  if$
}

FUNCTION {author.key.label}
{ author empty$
    { key empty$
        { cite$ #1 #3 substring$ }
        'key
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.editor.key.label}
{ author empty$
    { editor empty$
        { key empty$
            { cite$ #1 #3 substring$ }
            'key
          if$
        }
        { editor format.lab.names }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {editor.key.label}
{ editor empty$
    { key empty$
        { cite$ #1 #3 substring$ }
        'key
      if$
    }
    { editor format.lab.names }
  if$
}

FUNCTION {calc.short.authors}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label
    { type$ "proceedings" =
        'editor.key.label
        'author.key.label
      if$
    }
  if$
  'short.list :=
}

FUNCTION {calc.label}
{ calc.short.authors
  short.list
  "("
  *
  year duplicate$ empty$
  short.list key field.or.null = or
     { pop$ "" }
     'skip$
  if$
  *
  'label :=
}

FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{vv{ } }{ll{ }}{  ff{ }}{  jj{ }}" format.name$ 't :=
      nameptr #1 >
        { "   " *
          namesleft #1 = t "others" = and
            { "zzzzz" * }
            { t sortify * }
          if$
        }
        { t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {author.sort}
{ author empty$
    { key empty$
        { title field.or.null sortify }
        { key sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
        { key empty$
            { title field.or.null sortify }
            { key sortify }
          if$
        }
        { editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {editor.sort}
{ editor empty$
    { key empty$
        { title field.or.null sortify }
        { key sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

FUNCTION {presort}
{ calc.label
  type$ "book" =
  type$ "inbook" =
  or
    'author.editor.sort
    { type$ "proceedings" =
        'editor.sort
        'author.sort
      if$
    }
  if$
  "    "
  *
  year field.or.null sortify
  *
  "    "
  *
  cite$
  *
  #1 entry.max$ substring$
  'sort.label :=
  label sortify
  "    "
  *
  sort.label *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {presort}

SORT

STRINGS { last.label next.extra }
INTEGERS { last.extra.num number.label }

FUNCTION {initialize.longest.label}
{ #0 int.to.chr$ 'last.label :=
  "" 'next.extra :=
  #0 'last.extra.num :=
  #0 'number.label :=
}

FUNCTION {forward.pass}
{ en_skip empty$ not
    { "" 'extra.label := }
    { last.label label =
        { last.extra.num #1 + 'last.extra.num :=
          last.extra.num int.to.chr$ 'extra.label :=
        }
        { "a" chr.to.int$ 'last.extra.num :=
          "" 'extra.label :=
          label 'last.label :=
        }
      if$
      number.label #1 + 'number.label :=
    }
  if$
}

FUNCTION {reverse.pass}
{ en_skip empty$ not
    'skip$
    { next.extra "b" =
        { "a" 'extra.label := }
        'skip$
      if$
      extra.label 'next.extra :=
      extra.label
      duplicate$ empty$
        'skip$
        { "{\natexlab{" swap$ * "}}" * }
      if$
      'extra.label :=
      label extra.label * 'label :=
    }
  if$
}

EXECUTE {initialize.longest.label}
ITERATE {forward.pass}
REVERSE {reverse.pass}

FUNCTION {bib.sort.order}
{ sort.label 'sort.key$ := }

ITERATE {bib.sort.order}
SORT

FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{" number.label int.to.str$ * "}" *
  write$ newline$
  "\providecommand{\natexlab}[1]{#1}"
  write$ newline$
  "\providecommand{\bibdoi}[1]{DOI:~\texttt{#1}}"
  write$ newline$
  "\providecommand{\biburl}[1]{URL:~\texttt{#1}}"
  write$ newline$
}

FUNCTION {call.type.if.included}
{ en_skip empty$
    'call.type$
    'skip$
  if$
}

EXECUTE {begin.bib}
EXECUTE {init.state.consts}
ITERATE {call.type.if.included}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}
