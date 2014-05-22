$ keytool -genkey -v -keystore broadcaster-release-key.keystore -alias broadcast                                                    er_release -keyalg RSA -keysize 2048 -validity 10000
Enter keystore password:  @dev0303
Re-enter new password: @dev0303
What is your first and last name?
  [Unknown]:  pengqi xu
What is the name of your organizational unit?
  [Unknown]:  xpq
What is the name of your organization?
  [Unknown]:  xpq
What is the name of your City or Locality?
  [Unknown]:  ca
What is the name of your State or Province?
  [Unknown]:  ca
What is the two-letter country code for this unit?
  [Unknown]:  ca
Is CN=pengqi xu, OU=xpq, O=xpq, L=ca, ST=ca, C=ca correct?
  [no]:  no
What is your first and last name?
  [pengqi xu]:  pengqi xu
What is the name of your organizational unit?
  [xpq]:  xpq
What is the name of your organization?
  [xpq]:  xpq
What is the name of your City or Locality?
  [ca]:  san jose
What is the name of your State or Province?
  [ca]:  ca
What is the two-letter country code for this unit?
  [ca]:  us
Is CN=pengqi xu, OU=xpq, O=xpq, L=san jose, ST=ca, C=us correct?
  [no]:  yes

Generating 2,048 bit RSA key pair and self-signed certificate (SHA256withRSA) wi                                                    th a validity of 10,000 days
        for: CN=pengqi xu, OU=xpq, O=xpq, L=san jose, ST=ca, C=us
Enter key password for <broadcaster_release>
        (RETURN if same as keystore password):  @dev0303
Re-enter new password: @dev0303
New certificate (self-signed):
[
[
  Version: V3
  Subject: CN=pengqi xu, OU=xpq, O=xpq, L=san jose, ST=ca, C=us
  Signature Algorithm: SHA256withRSA, OID = 1.2.840.113549.1.1.11

  Key:  Sun RSA public key, 2048 bits
  modulus: 22779858198205039350293192117422752297379465262807875712774912982667261272051379614308752347692018999641231966285193739508204615824996336214065109756376030378033428839184785787707052178235774625751411162941197819716368710185291273737844654596517517545597010644476262732622456476767118335855058097185664511795930024073916672410254420040763076477538832606094994960595138917401140743248354004439742189486431754388027375616060721650624576561287741990545063945686483219306841471201520384781591907980286408538185159797922582566898121142546928836954758772135351385214961569973342632212671605691293328871176365990547084482609
  public exponent: 65537
  Validity: [From: Mon Jan 27 20:24:45 PST 2014,
               To: Fri Jun 14 21:24:45 PDT 2041]
  Issuer: CN=pengqi xu, OU=xpq, O=xpq, L=san jose, ST=ca, C=us
  SerialNumber: [    484add1f]

Certificate Extensions: 1
[1]: ObjectId: 2.5.29.14 Criticality=false
SubjectKeyIdentifier [
KeyIdentifier [
0000: DF 45 C8 B0 DC F3 6C 08   19 82 80 AC 05 EE 9E FC  .E....l.........
0010: A1 47 61 1E                                        .Ga.
]
]

]
  Algorithm: [SHA256withRSA]
  Signature:
0000: 47 47 28 EB 02 73 A6 AB   5E C7 97 17 9C C8 3E CA  GG(..s..^.....>.
0010: FA C0 04 07 3D 92 B1 10   91 F8 53 06 31 37 7D A8  ....=.....S.17..
0020: 86 7A 20 30 37 22 F4 50   0A 8F 08 FB 4D 3D 24 24  .z 07".P....M=$$
0030: F4 DA 76 27 C5 9B 43 1D   2C CC 65 10 FE 96 EC FF  ..v'..C.,.e.....
0040: 8A 9C 2A 39 61 77 35 CF   3B 11 71 B2 E5 2A 8E 3B  ..*9aw5.;.q..*.;
0050: A1 65 89 1D FD EA EF 02   BD EF FA 36 EE 59 96 B0  .e.........6.Y..
0060: 62 25 00 20 77 EB 76 70   54 14 F8 22 22 E6 4F 40  b%. w.vpT.."".O@
0070: 58 2F 3B 27 92 18 F4 D0   AA 88 F8 0A 91 39 48 A7  X/;'.........9H.
0080: 9C 81 55 DF 9D 85 98 7B   49 9D 1A 85 46 44 05 04  ..U.....I...FD..
0090: DF B8 DE FC 72 1F 09 58   13 54 E3 BD B9 47 7F C0  ....r..X.T...G..
00A0: 31 52 E9 43 B5 2B BF FF   7A 39 BA CA 65 40 55 F8  1R.C.+..z9..e@U.
00B0: E8 57 91 2E 76 10 52 60   2F CE D3 E1 A1 27 3C CA  .W..v.R`/....'<.
00C0: 1D A0 FC 13 63 C3 C6 C9   B0 1C 30 55 E1 C1 41 26  ....c.....0U..A&
00D0: F8 FF F3 80 2D CB 8C 23   5F F3 05 03 5C 75 10 79  ....-..#_...\u.y
00E0: 3D C9 B6 60 6A 3D 81 2A   C1 FD D1 62 3B 2C 66 E1  =..`j=.*...b;,f.
00F0: 8D EC 89 58 06 91 8E CE   E9 2A 96 7B 5F 3D 1F 9B  ...X.....*.._=..

]
[Storing broadcaster-release-key.keystore]

