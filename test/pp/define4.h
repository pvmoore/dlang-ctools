
start

#define _SAL_nop_impl_ X
#define _SA_annotes2(n,pp1,pp2)
#define _SA_annotes3(n,pp1,pp2,pp3)
#define _GrouP_impl_(annos)
#define _GrouP_(annos)                 _GrouP_impl_(annos _SAL_nop_impl_)
#define _Range_impl_(min,max)
#define _Field_range_impl_(min,max)

#define _SAL2_Source_(Name, args, annotes) _SA_annotes3(SAL_name, #Name, "", "2") _GrouP_(annotes _SAL_nop_impl_)
#define _Field_range_(min,max) _SAL2_Source_(_Field_range_, (min,max), _Field_range_impl_(min,max))


typedef struct __crt_locale_data_public
{
      unsigned short const* _locale_pctype;
    _Field_range_(1, 2) int _locale_mb_cur_max;
               unsigned int _locale_lc_codepage;
};

end

/*
TOKENS:
    start
    typedef struct __crt_locale_data_public
    {
        unsigned short const * _locale_pctype ;
        int _locale_mb_cur_max ;
        unsigned int _locale_lc_codepage ;
    } ;
    end
*/