/*
 * Seahorse
 *
 * Copyright (C) 2018 Niels De Graef
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this program; if not, see
 * <http://www.gnu.org/licenses/>.
 */

/**
 * Although there are some VAPI files that take care of the bindings to
 * Cryptoki, they are woefully inadequate, so maintain our own bindings here
 * for now.
 *
 * Most of these were made by taking some stuff of the header and doing some
 * regex magix on them.
 */
[CCode (cprefix = "CK_")]
namespace Cryptoki {
    [CCode (cname = "ulong", cprefix = "CKA_", has_type_id = false)]
    public enum Attribute {
        CLASS,
        TOKEN,
        PRIVATE,
        LABEL,
        APPLICATION,
        VALUE,
        OBJECT_ID,
        CERTIFICATE_TYPE,
        ISSUER,
        SERIAL_NUMBER,
        AC_ISSUER,
        OWNER,
        ATTR_TYPES,
        TRUSTED,
        CERTIFICATE_CATEGORY,
        JAVA_MIDP_SECURITY_DOMAIN,
        URL,
        HASH_OF_SUBJECT_PUBLIC_KEY,
        HASH_OF_ISSUER_PUBLIC_KEY,
        CHECK_VALUE,
        KEY_TYPE,
        SUBJECT,
        ID,
        SENSITIVE,
        ENCRYPT,
        DECRYPT,
        WRAP,
        UNWRAP,
        SIGN,
        SIGN_RECOVER,
        VERIFY,
        VERIFY_RECOVER,
        DERIVE,
        START_DATE,
        END_DATE,
        MODULUS,
        MODULUS_BITS,
        PUBLIC_EXPONENT,
        PRIVATE_EXPONENT,
        PRIME_1,
        PRIME_2,
        EXPONENT_1,
        EXPONENT_2,
        COEFFICIENT,
        PRIME,
        SUBPRIME,
        BASE,
        PRIME_BITS,
        SUB_PRIME_BITS,
        VALUE_BITS,
        VALUE_LEN,
        EXTRACTABLE,
        LOCAL,
        NEVER_EXTRACTABLE,
        ALWAYS_SENSITIVE,
        KEY_GEN_MECHANISM,
        MODIFIABLE,
        COPYABLE,
        ECDSA_PARAMS,
        EC_PARAMS,
        EC_POINT,
        SECONDARY_AUTH,
        AUTH_PIN_FLAGS,
        ALWAYS_AUTHENTICATE,
        WRAP_WITH_TRUSTED,
        OTP_FORMAT,
        OTP_LENGTH,
        OTP_TIME_INTERVAL,
        OTP_USER_FRIENDLY_MODE,
        OTP_CHALLENGE_REQUIREMENT,
        OTP_TIME_REQUIREMENT,
        OTP_COUNTER_REQUIREMENT,
        OTP_PIN_REQUIREMENT,
        OTP_USER_IDENTIFIER,
        OTP_SERVICE_IDENTIFIER,
        OTP_SERVICE_LOGO,
        OTP_SERVICE_LOGO_TYPE,
        OTP_COUNTER,
        OTP_TIME,
        GOSTR3410_PARAMS,
        GOSTR3411_PARAMS,
        GOST28147_PARAMS,
        HW_FEATURE_TYPE,
        RESET_ON_INIT,
        HAS_RESET,
        PIXEL_X,
        PIXEL_Y,
        RESOLUTION,
        CHAR_ROWS,
        CHAR_COLUMNS,
        COLOR,
        BITS_PER_PIXEL,
        CHAR_SETS,
        ENCODING_METHODS,
        MIME_TYPES,
        MECHANISM_TYPE,
        REQUIRED_CMS_ATTRIBUTES,
        DEFAULT_CMS_ATTRIBUTES,
        SUPPORTED_CMS_ATTRIBUTES,
        WRAP_TEMPLATE,
        UNWRAP_TEMPLATE,
        ALLOWED_MECHANISMS,
        VENDOR_DEFINED,
    }

    [CCode (cname = "ulong", cprefix = "CKM_", has_type_id = false)]
    public enum MechanismType {
        RSA_PKCS_KEY_PAIR_GEN,
        RSA_PKCS,
        RSA_9796,
        RSA_X_509,
        MD2_RSA_PKCS,
        MD5_RSA_PKCS,
        SHA1_RSA_PKCS,
        RIPEMD128_RSA_PKCS,
        RIPEMD160_RSA_PKCS,
        RSA_PKCS_OAEP,
        RSA_X9_31_KEY_PAIR_GEN,
        RSA_X9_31,
        SHA1_RSA_X9_31,
        RSA_PKCS_PSS,
        SHA1_RSA_PKCS_PSS,
        DSA_KEY_PAIR_GEN,
        DSA,
        DSA_SHA1,
        DH_PKCS_KEY_PAIR_GEN,
        DH_PKCS_DERIVE,
        X9_42_DH_KEY_PAIR_GEN,
        X9_42_DH_DERIVE,
        X9_42_DH_HYBRID_DERIVE,
        X9_42_MQV_DERIVE,
        SHA256_RSA_PKCS,
        SHA384_RSA_PKCS,
        SHA512_RSA_PKCS,
        SHA256_RSA_PKCS_PSS,
        SHA384_RSA_PKCS_PSS,
        SHA512_RSA_PKCS_PSS,
        RC2_KEY_GEN,
        RC2_ECB,
        RC2_CBC,
        RC2_MAC,
        RC2_MAC_GENERAL,
        RC2_CBC_PAD,
        RC4_KEY_GEN,
        RC4,
        DES_KEY_GEN,
        DES_ECB,
        DES_CBC,
        DES_MAC,
        DES_MAC_GENERAL,
        DES_CBC_PAD,
        DES2_KEY_GEN,
        DES3_KEY_GEN,
        DES3_ECB,
        DES3_CBC,
        DES3_MAC,
        DES3_MAC_GENERAL,
        DES3_CBC_PAD,
        CDMF_KEY_GEN,
        CDMF_ECB,
        CDMF_CBC,
        CDMF_MAC,
        CDMF_MAC_GENERAL,
        CDMF_CBC_PAD,
        DES_OFB64,
        DES_OFB8,
        DES_CFB64,
        DES_CFB8,
        MD2,
        MD2_HMAC,
        MD2_HMAC_GENERAL,
        MD5,
        MD5_HMAC,
        MD5_HMAC_GENERAL,
        SHA_1,
        SHA_1_HMAC,
        SHA_1_HMAC_GENERAL,
        RIPEMD128,
        RIPEMD128_HMAC,
        RIPEMD128_HMAC_GENERAL,
        RIPEMD160,
        RIPEMD160_HMAC,
        RIPEMD160_HMAC_GENERAL,
        SHA256,
        SHA256_HMAC,
        SHA256_HMAC_GENERAL,
        SHA384,
        SHA384_HMAC,
        SHA384_HMAC_GENERAL,
        SHA512,
        SHA512_HMAC,
        SHA512_HMAC_GENERAL,
        SECURID_KEY_GEN,
        SECURID,
        HOTP_KEY_GEN,
        HOTP,
        ACTI,
        ACTI_KEY_GEN,
        CAST_KEY_GEN,
        CAST_ECB,
        CAST_CBC,
        CAST_MAC,
        CAST_MAC_GENERAL,
        CAST_CBC_PAD,
        CAST3_KEY_GEN,
        CAST3_ECB,
        CAST3_CBC,
        CAST3_MAC,
        CAST3_MAC_GENERAL,
        CAST3_CBC_PAD,
        CAST5_KEY_GEN,
        CAST128_KEY_GEN,
        CAST5_ECB,
        CAST128_ECB,
        CAST5_CBC,
        CAST128_CBC,
        CAST5_MAC,
        CAST128_MAC,
        CAST5_MAC_GENERAL,
        CAST128_MAC_GENERAL,
        CAST5_CBC_PAD,
        CAST128_CBC_PAD,
        RC5_KEY_GEN,
        RC5_ECB,
        RC5_CBC,
        RC5_MAC,
        RC5_MAC_GENERAL,
        RC5_CBC_PAD,
        IDEA_KEY_GEN,
        IDEA_ECB,
        IDEA_CBC,
        IDEA_MAC,
        IDEA_MAC_GENERAL,
        IDEA_CBC_PAD,
        GENERIC_SECRET_KEY_GEN,
        CONCATENATE_BASE_AND_KEY,
        CONCATENATE_BASE_AND_DATA,
        CONCATENATE_DATA_AND_BASE,
        XOR_BASE_AND_DATA,
        EXTRACT_KEY_FROM_KEY,
        SSL3_PRE_MASTER_KEY_GEN,
        SSL3_MASTER_KEY_DERIVE,
        SSL3_KEY_AND_MAC_DERIVE,
        SSL3_MASTER_KEY_DERIVE_DH,
        TLS_PRE_MASTER_KEY_GEN,
        TLS_MASTER_KEY_DERIVE,
        TLS_KEY_AND_MAC_DERIVE,
        TLS_MASTER_KEY_DERIVE_DH,
        TLS_PRF,
        SSL3_MD5_MAC,
        SSL3_SHA1_MAC,
        MD5_KEY_DERIVATION,
        MD2_KEY_DERIVATION,
        SHA1_KEY_DERIVATION,
        SHA256_KEY_DERIVATION,
        SHA384_KEY_DERIVATION,
        SHA512_KEY_DERIVATION,
        PBE_MD2_DES_CBC,
        PBE_MD5_DES_CBC,
        PBE_MD5_CAST_CBC,
        PBE_MD5_CAST3_CBC,
        PBE_MD5_CAST5_CBC,
        PBE_MD5_CAST128_CBC,
        PBE_SHA1_CAST5_CBC,
        PBE_SHA1_CAST128_CBC,
        PBE_SHA1_RC4_128,
        PBE_SHA1_RC4_40,
        PBE_SHA1_DES3_EDE_CBC,
        PBE_SHA1_DES2_EDE_CBC,
        PBE_SHA1_RC2_128_CBC,
        PBE_SHA1_RC2_40_CBC,
        PKCS5_PBKD2,
        PBA_SHA1_WITH_SHA1_HMAC,
        WTLS_PRE_MASTER_KEY_GEN,
        WTLS_MASTER_KEY_DERIVE,
        WTLS_MASTER_KEY_DERIVE_DH_ECC,
        WTLS_PRF,
        WTLS_SERVER_KEY_AND_MAC_DERIVE,
        WTLS_CLIENT_KEY_AND_MAC_DERIVE,
        KEY_WRAP_LYNKS,
        KEY_WRAP_SET_OAEP,
        CMS_SIG,
        SKIPJACK_KEY_GEN,
        SKIPJACK_ECB64,
        SKIPJACK_CBC64,
        SKIPJACK_OFB64,
        SKIPJACK_CFB64,
        SKIPJACK_CFB32,
        SKIPJACK_CFB16,
        SKIPJACK_CFB8,
        SKIPJACK_WRAP,
        SKIPJACK_PRIVATE_WRAP,
        SKIPJACK_RELAYX,
        KEA_KEY_PAIR_GEN,
        KEA_KEY_DERIVE,
        FORTEZZA_TIMESTAMP,
        BATON_KEY_GEN,
        BATON_ECB128,
        BATON_ECB96,
        BATON_CBC128,
        BATON_COUNTER,
        BATON_SHUFFLE,
        BATON_WRAP,
        ECDSA_KEY_PAIR_GEN,
        EC_KEY_PAIR_GEN,
        ECDSA,
        ECDSA_SHA1,
        ECDH1_DERIVE,
        ECDH1_COFACTOR_DERIVE,
        ECMQV_DERIVE,
        JUNIPER_KEY_GEN,
        JUNIPER_ECB128,
        JUNIPER_CBC128,
        JUNIPER_COUNTER,
        JUNIPER_SHUFFLE,
        JUNIPER_WRAP,
        FASTHASH,
        AES_KEY_GEN,
        AES_ECB,
        AES_CBC,
        AES_MAC,
        AES_MAC_GENERAL,
        AES_CBC_PAD,
        BLOWFISH_KEY_GEN,
        BLOWFISH_CBC,
        TWOFISH_KEY_GEN,
        TWOFISH_CBC,
        DES_ECB_ENCRYPT_DATA,
        DES_CBC_ENCRYPT_DATA,
        DES3_ECB_ENCRYPT_DATA,
        DES3_CBC_ENCRYPT_DATA,
        AES_ECB_ENCRYPT_DATA,
        AES_CBC_ENCRYPT_DATA,
        GOSTR3410_KEY_PAIR_GEN,
        GOSTR3410,
        GOSTR3410_WITH_GOSTR3411,
        GOSTR3410_KEY_WRAP,
        GOSTR3410_DERIVE,
        GOSTR3411,
        GOSTR3411_HMAC,
        GOST28147_KEY_GEN,
        GOST28147_ECB,
        GOST28147,
        GOST28147_MAC,
        GOST28147_KEY_WRAP,
        DSA_PARAMETER_GEN,
        DH_PKCS_PARAMETER_GEN,
        X9_42_DH_PARAMETER_GEN,
        VENDOR_DEFINED,
    }

    [CCode (cname = "ulong", cprefix = "CKO_", has_type_id = false)]
    public enum ObjectClass {
        DATA,
        CERTIFICATE,
        PUBLIC_KEY,
        PRIVATE_KEY,
        SECRET_KEY,
        HW_FEATURE,
        DOMAIN_PARAMETERS,
        MECHANISM,
        OTP_KEY,
        VENDOR_DEFINED,
    }
}