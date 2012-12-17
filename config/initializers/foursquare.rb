if Rails.env == 'production'
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :foursquare, '5XVFMQDQHANNOGTFHCNPVDUM4SNECPAN5XXX0JWWWL0N4ZUG', '1O1Y5UQCAKBIUNGNZYFA5CILWHPJNWPZTPI13RXQVIL0MJ4M'
  end
else
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :foursquare, 'CA2UEUC0W0B1AII5ZZDOGT3CWBBH0JTRCJ2LTPJCZ1FCI2WP', 'I0VDAQPD4ZOGD1JB00QU224ZEI0AIECCRRZORUNHAAWFHDPA'
  end
end