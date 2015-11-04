#
# Be sure to run `pod lib lint SystranGeographicClient.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = "SystranGeographicClient"
    s.version          = "1.0.0"

    s.summary          = "REST Geographic API"
    s.description      = <<-DESC
                         ### Introduction\n\nREST API to retrieve geographic point of interests.\n\n### Cross Domain\n\nGeographic API supports cross-domain requests through the JSONP or the CORS mechanism.\n\nGeographic API also supports the Silverlight client access policy file\n(clientaccesspolicy.xml) and the Adobe Flash cross-domain policy file (crossdomain.xml) that handles cross-domain requests.\n\n#### JSONP Support\n\nGeographic API supports JSONP by providing the name of the callback function as a parameter. The response body will be contained in the parentheses:\n\n```javascript\ncallbackFunctionName(/* response body as defined in each API section */);\n```\n\nFor example, for a supportedLanguages call with the callback set to supportedLanguagesCallback, the response body will be similar to the following:\n\n```javascript\nsupportedLanguagesCallback({\n  \&quot;languages\&quot;: [\&quot;en\&quot;, \&quot;fr\&quot;]\n});\n```\n\n#### CORS\n\nGeographic API supports the CORS mechanism to handle cross-domain requests. The server will correctly handle the OPTIONS requests used by CORS.\n\nThe following headers are set as follows:\n\n```\nAccess-Control-Allow-Origin: *\nAccess-Control-Allow-Headers: X-Requested-With,Content-Type,X-HTTP-METHOD-OVERRIDE\n    ```\n\n\n### Escaping of the input text\n\nThe input text passed as a URL parameter will be escaped with an equivalent of the javascript &#39;encodeURIComponent&#39; function.\n\n### Encoding of the input text\n\nThe input text must be encoded in UTF-8.\n\n### Encoding of the output text\n\nThe output text will be encoded in UTF-8.
                         DESC

    s.platform     = :ios, '7.0'
    s.requires_arc = true

    s.framework    = 'SystemConfiguration'
    
    s.source_files = 'SystranGeographicClient/**/*'
    s.public_header_files = 'SystranGeographicClient/**/*.h'

    s.dependency 'AFNetworking', '~> 2.3'
    s.dependency 'JSONModel', '~> 1.1'
    s.dependency 'ISO8601', '~> 0.3'
end

