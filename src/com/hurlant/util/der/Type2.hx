package com.hurlant.util.der;


import com.hurlant.util.asn1.parser.*;
import com.hurlant.util.asn1.type.ASN1Type;
import com.hurlant.util.asn1.type.OIDType;

class Type2
{
    //  specifications of Upper Bounds
    //  shall be regarded as mandatory
    //  from Annex B of ITU-T X.411
    //  Reference Definition of MTS Parameter Upper Bounds
    
    //      Upper Bounds
    public static inline var ub_name : Int32 = 32768;
    public static inline var ub_common_name : Int32 = 64;
    public static inline var ub_locality_name : Int32 = 128;
    public static inline var ub_state_name : Int32 = 128;
    public static inline var ub_organization_name : Int32 = 64;
    public static inline var ub_organizational_unit_name : Int32 = 64;
    public static inline var ub_title : Int32 = 64;
    public static inline var ub_match : Int32 = 128;
    
    public static inline var ub_emailaddress_length : Int32 = 128;
    
    public static inline var ub_common_name_length : Int32 = 64;
    public static inline var ub_country_name_alpha_length : Int32 = 2;
    public static inline var ub_country_name_numeric_length : Int32 = 3;
    public static inline var ub_domain_defined_attributes : Int32 = 4;
    public static inline var ub_domain_defined_attribute_type_length : Int32 = 8;
    public static inline var ub_domain_defined_attribute_value_length : Int32 = 128;
    public static inline var ub_domain_name_length : Int32 = 16;
    public static inline var ub_extension_attributes : Int32 = 256;
    public static inline var ub_e163_4_number_length : Int32 = 15;
    public static inline var ub_e163_4_sub_address_length : Int32 = 40;
    public static inline var ub_generation_qualifier_length : Int32 = 3;
    public static inline var ub_given_name_length : Int32 = 16;
    public static inline var ub_initials_length : Int32 = 5;
    public static inline var ub_integer_options : Int32 = 256;
    public static inline var ub_numeric_user_id_length : Int32 = 32;
    public static inline var ub_organization_name_length : Int32 = 64;
    public static inline var ub_organizational_unit_name_length : Int32 = 32;
    public static inline var ub_organizational_units : Int32 = 4;
    public static inline var ub_pds_name_length : Int32 = 16;
    public static inline var ub_pds_parameter_length : Int32 = 30;
    public static inline var ub_pds_physical_address_lines : Int32 = 6;
    public static inline var ub_postal_code_length : Int32 = 16;
    public static inline var ub_surname_length : Int32 = 40;
    public static inline var ub_terminal_id_length : Int32 = 24;
    public static inline var ub_unformatted_address_length : Int32 = 180;
    public static inline var ub_x121_address_length : Int32 = 16;
    public static inline var ub_pkcs9_string : Int32 = 255;  // see ftp://ftp.rsasecurity.com/pub/pkcs/pkcs-9-v2/pkcs-9.pdf, ASN.1 module, pkcs-9-ub-pkcs9String
    
    // Note - upper bounds on TeletexString are measured in characters.
    // A significantly greater number of octets will be required to hold
    // such a value.  As a minimum, 16 octets, or twice the specified upper
    // bound, whichever is the larger, should be allowed.
    // XXX ASN-1 was clearly invented to scare children.
    
    // yay for implicit upper bounds being explicitely specified.
    public static var MAX : Int32 = Int.MAX_VALUE;
    
    // PKIX specific OIDs
    public static inline var iso : String = "1";
    public static inline var identified_organization : String = "3";
    public static inline var dod : String = "6";
    public static inline var internet : String = "1";
    public static inline var security : String = "5";
    public static inline var mechanisms : String = "5";
    public static inline var pkix : String = "7";
    public static var id_pkix : OIDType = oid(iso, identified_organization, dod, internet, security, mechanisms, pkix);
    
    // PKIX arcs
    // arc for private certificate extensions
    public static var id_pe : OIDType = oid(id_pkix, 1);
    // arc for policy qualifier types
    public static var id_qt : OIDType = oid(id_pkix, 2);
    // arc for extended key purpose OIDS
    public static var id_kp : OIDType = oid(id_pkix, 3);
    // arc for access descriptors
    public static var id_ad : OIDType = oid(id_pkix, 48);
    
    // policyQualifierIds for Internet policy qualifiers
    //		OID for CPS qualifier
    public static var id_qt_cps : OIDType = oid(id_qt, 1);
    //		OID for user notice qualifier
    public static var id_qt_unotice : OIDType = oid(id_qt, 2);
    
    public static var pkcs_9 : OIDType = oid(iso, member_body, us, rsadsi, pkcs, 9);
    public static var emailAddress : OIDType = oid(pkcs_9, 1);
    // oh look, an Unstructured Name ... Joy..YAY for VMWare. BP
    public static var pkcs9_unstructuredName : OIDType = oid(pkcs_9, 2);
    
    // object identifiers for Name type and directory attribute support
    
    // Object identifier assignments
    public static inline var joint_iso_ccitt : String = "2";
    public static inline var ds : String = "5";
    public static var id_at : OIDType = oid(joint_iso_ccitt, ds, 4);
    // Attributes
    public static var id_at_commonName : OIDType = oid(id_at, 3);
    public static var id_at_surname : OIDType = oid(id_at, 4);
    public static var id_at_countryName : OIDType = oid(id_at, 6);
    public static var id_at_localityName : OIDType = oid(id_at, 7);
    public static var id_at_stateOrProvinceName : OIDType = oid(id_at, 8);
    public static var id_at_organizationName : OIDType = oid(id_at, 10);
    public static var id_at_organizationalUnitName : OIDType = oid(id_at, 11);
    public static var id_at_title : OIDType = oid(id_at, 12);
    public static var id_at_name : OIDType = oid(id_at, 41);
    public static var id_at_givenName : OIDType = oid(id_at, 42);
    public static var id_at_initials : OIDType = oid(id_at, 43);
    public static var id_at_generationQualifier : OIDType = oid(id_at, 44);
    public static var id_at_dnQualifier : OIDType = oid(id_at, 46);
    
    // algorithm identifiers and parameter structures
    public static inline var member_body : String = "2";
    public static inline var us : String = "840";
    public static inline var rsadsi : String = "113549";
    public static inline var pkcs : String = "1";
    public static inline var x9_57 : String = "10040";
    public static inline var x9algorithm : String = "4";
    public static inline var ansi_x942 : String = "10046";
    public static inline var number_type : String = "2";
    public static var pkcs_1 : OIDType = oid(iso, member_body, us, rsadsi, pkcs, 1);
    
    public static var rsaEncryption : OIDType = oid(pkcs_1, 1);
    public static var md2WithRSAEncryption : OIDType = oid(pkcs_1, 2);
    public static var md5WithRSAEncryption : OIDType = oid(pkcs_1, 4);
    public static var sha1WithRSAEncryption : OIDType = oid(pkcs_1, 5);
    public static var id_dsa_with_sha1 : OIDType = oid(iso, member_body, us, x9_57, x9algorithm, 3);
    public static var Dss_Sig_Value : ASN1Type = sequence(
                {
                    r : integer()

                },
                {
                    s : integer()

                }
                );
    public static var dhpublicnumber : OIDType = oid(iso, member_body, us, ansi_x942, number_type, 1);
    public static var ValidationParms : ASN1Type = sequence(
                {
                    seed : bitString()

                },
                {
                    pgenCounter : integer()

                }
                );
    public static var DomainParameters : ASN1Type = sequence(
                {
                    p : integer()

                },  // odd prime, p=jq +1  
                {
                    g : integer()

                },  // generator, g  
                {
                    q : integer()

                },  // factor of p-1  
                {
                    j : optional(integer())

                },  // subgroup factor, j>= 2  
                {
                    validationParms : optional(ValidationParms)

                }
                );
    public static var id_dsa : OIDType = oid(iso, member_body, us, x9_57, x9algorithm, 1);
    public static var Dss_Parms : ASN1Type = sequence(
                {
                    p : integer()

                },
                {
                    q : integer()

                },
                {
                    g : integer()

                }
                );
    // attribute data type
    public static var Attribute : Function = function(Type : ASN1Type, id : OIDType) : ASN1Type{
            return sequence(
                    {
                        type : id

                    },
                    {
                        values : setOf(Type, 1, MAX)

                    }
                    );
        };
    
    
    public static var Version : ASN1Type = integer();
    
    public static var Extension : ASN1Type = sequence(
                {
                    extnId : oid()

                },
                {
                    critical : defaultValue(false, Bool())

                },
                {
                    extnValue : octetString()

                }  // not quite enough. see line 5155  
                );
    public static var Extensions : ASN1Type = sequenceOf(Extension, 1, MAX);
    public static var UniqueIdentifier : ASN1Type = bitString();
    public static var CertificateSerialNumber : ASN1Type = integer();
    
    // Directory string type, used extensively in Name types
    public static var directoryString : Function = function(maxSize : Int32) : ASN1Type{
            return choice(
                    {
                        teletexString : teletexString(1, maxSize)

                    },
                    {
                        printableString : printableString(1, maxSize)

                    },
                    {
                        universalString : universalString(1, maxSize)

                    },
                    {
                        bmpString : bmpString(1, maxSize)

                    },
                    {
                        utf8String : utf8String(1, maxSize)

                    }
                    );
        };
    
    // PKCS9 string value, handled for VMWare cases (and anyone with pkcs unstructured strings
    public static var pkcs9string : Function = function(maxSize : Int32) : ASN1Type{
            return choice(
                    {
                        utf8String : utf8String(1, maxSize)

                    },
                    {
                        directoryString : directoryString(maxSize)

                    }
                    );
        };
    
    public static var AttributeTypeAndValue : ASN1Type = null;
    /*
		public static const AttributeTypeAndValue:ASN1Type = choice(
			{ name: sequence(
				{ type: id_at_name },
				{ value: directoryString(ub_name) }
			)},
			{ commonName: sequence(
				{ type: id_at_commonName },
				{ value: directoryString(ub_common_name) }
			)},
			{ surname: sequence(
				{ type: id_at_surname },
				{ value: directoryString(ub_name) }
			)},
			{ givenName: sequence(
				{ type: id_at_givenName },
				{ value: directoryString(ub_name) }
			)},
			{ initials: sequence(
				{ type: id_at_initials },
				{ value: directoryString(ub_name) }
			)},
			{ generationQualifier: sequence(
				{ type: id_at_generationQualifier },
				{ value: directoryString(ub_name) }
			)},
			{ dnQualifier: sequence(
				{ type: id_at_dnQualifier },
				{ value: printableString() }
			)},
			{ countryName: sequence(
				{ type: id_at_countryName },
				{ value: printableString(2) } // IS 3166 codes only
			)},
			{ localityName: sequence(
				{ type: id_at_localityName },
				{ value: directoryString(ub_locality_name) }
			)},
			{ stateOrProvinceName: sequence(
				{ type: id_at_stateOrProvinceName },
				{ value: directoryString(ub_state_name) }
			)},
			{ organizationName: sequence(
				{ type: id_at_organizationName },
				{ value: directoryString(ub_organization_name) }
			)},
			{ organizationalUnitName: sequence(
				{ type: id_at_organizationalUnitName },
				{ value: directoryString(ub_organizational_unit_name) }
			)},
			{ title: sequence(
				{ type: id_at_title },
				{ value: directoryString(ub_title) }
			)},
			// Legacy attributes
			{ pkcs9email: sequence(
				{ type: emailAddress },
				{ value: ia5String(ub_emailaddress_length) }
			)},
			{ pkcs9UnstructuredName: sequence(
				{ type : pkcs9_unstructuredName },
				{ value: pkcs9string(ub_pkcs9_string) }
			)}
			
		);
		*/
    public static var RelativeDistinguishedName : ASN1Type = setOf(AttributeTypeAndValue, 1, MAX);
    public static var RDNSequence : ASN1Type = sequenceOf(RelativeDistinguishedName);
    public static var Name : ASN1Type = choice({
                    sequence : RDNSequence

                });
    
    public static var Time : ASN1Type = choice(
                {
                    utcTime : utcTime()

                },
                {
                    generalTime : generalizedTime()

                }
                );
    public static var Validity : ASN1Type = sequence(
                {
                    notBefore : Time

                },
                {
                    notAfter : Time

                }
                );
    // Definition of AlgorithmIdentifier
    public static var AlgorithmIdentifier : ASN1Type = null;
    /*
		public static const AlgorithmIdentifier:ASN1Type = sequence(
			{ algorithm: oid() },
			// { parameters: optional(any()) } // XXX any not implemented (line 5281)
			{ parameters: optional(choice(
				{ none: nulll() },
				{ dss_parms: Dss_Parms },
				{ domainParameters: DomainParameters }
			  ))
			}
			
		);
		*/
    public static var SubjectPublicKeyInfo : ASN1Type = sequence(
                {
                    algorithm : AlgorithmIdentifier

                },
                {
                    subjectPublicKey : bitString()

                }
                );
    
    // Parameterized Type SIGNED
    public static var signed : Function = function(o : ASN1Type) : ASN1Type{
            return sequence(
                    {
                        toBeSigned : extract(o)

                    },
                    {
                        algorithm : AlgorithmIdentifier

                    },
                    {
                        signature : bitString()

                    }
                    );
        };
    
    // Public Key Certificate
    public static var Certificate : ASN1Type = signed(sequence(
                        {
                            version : explicitTag(0, ASN1Type.CONTEXT, defaultValue(0, Version))

                        },
                        {
                            serialNumber : CertificateSerialNumber

                        },
                        {
                            signature : AlgorithmIdentifier

                        },
                        {
                            issuer : extract(Name)

                        },
                        {
                            validity : Validity

                        },
                        {
                            subject : extract(Name)

                        },
                        {
                            subjectPublicKeyInfo : SubjectPublicKeyInfo

                        },
                        {
                            issuerUniqueIdentifier : implicitTag(1, ASN1Type.CONTEXT, optional(UniqueIdentifier))

                        },
                        {
                            subjectUniqueIdentifier : implicitTag(2, ASN1Type.CONTEXT, optional(UniqueIdentifier))

                        },
                        {
                            extensions : explicitTag(3, ASN1Type.CONTEXT, optional(Extensions))

                        }
                        ));

    public function new()
    {
    }
}

