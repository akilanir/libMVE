.class Lorg/spongycastle/math/ec/LongArray;
.super Ljava/lang/Object;
.source "LongArray.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field private static final INTERLEAVE2_TABLE:[S

.field private static final INTERLEAVE3_TABLE:[I

.field private static final INTERLEAVE4_TABLE:[I

.field private static final INTERLEAVE5_TABLE:[I

.field private static final INTERLEAVE7_TABLE:[J

.field private static final ZEROES:Ljava/lang/String; = "0000000000000000000000000000000000000000000000000000000000000000"

.field static final bitLengths:[B


# instance fields
.field private m_ints:[J


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/16 v2, 0x80

    const/16 v1, 0x100

    .line 17
    new-array v0, v1, [S

    fill-array-data v0, :array_32

    sput-object v0, Lorg/spongycastle/math/ec/LongArray;->INTERLEAVE2_TABLE:[S

    .line 56
    new-array v0, v2, [I

    fill-array-data v0, :array_136

    sput-object v0, Lorg/spongycastle/math/ec/LongArray;->INTERLEAVE3_TABLE:[I

    .line 79
    new-array v0, v1, [I

    fill-array-data v0, :array_23a

    sput-object v0, Lorg/spongycastle/math/ec/LongArray;->INTERLEAVE4_TABLE:[I

    .line 118
    new-array v0, v2, [I

    fill-array-data v0, :array_43e

    sput-object v0, Lorg/spongycastle/math/ec/LongArray;->INTERLEAVE5_TABLE:[I

    .line 140
    const/16 v0, 0x200

    new-array v0, v0, [J

    fill-array-data v0, :array_542

    sput-object v0, Lorg/spongycastle/math/ec/LongArray;->INTERLEAVE7_TABLE:[J

    .line 275
    new-array v0, v1, [B

    fill-array-data v0, :array_d46

    sput-object v0, Lorg/spongycastle/math/ec/LongArray;->bitLengths:[B

    return-void

    .line 17
    nop

    :array_32
    .array-data 2
        0x0s
        0x1s
        0x4s
        0x5s
        0x10s
        0x11s
        0x14s
        0x15s
        0x40s
        0x41s
        0x44s
        0x45s
        0x50s
        0x51s
        0x54s
        0x55s
        0x100s
        0x101s
        0x104s
        0x105s
        0x110s
        0x111s
        0x114s
        0x115s
        0x140s
        0x141s
        0x144s
        0x145s
        0x150s
        0x151s
        0x154s
        0x155s
        0x400s
        0x401s
        0x404s
        0x405s
        0x410s
        0x411s
        0x414s
        0x415s
        0x440s
        0x441s
        0x444s
        0x445s
        0x450s
        0x451s
        0x454s
        0x455s
        0x500s
        0x501s
        0x504s
        0x505s
        0x510s
        0x511s
        0x514s
        0x515s
        0x540s
        0x541s
        0x544s
        0x545s
        0x550s
        0x551s
        0x554s
        0x555s
        0x1000s
        0x1001s
        0x1004s
        0x1005s
        0x1010s
        0x1011s
        0x1014s
        0x1015s
        0x1040s
        0x1041s
        0x1044s
        0x1045s
        0x1050s
        0x1051s
        0x1054s
        0x1055s
        0x1100s
        0x1101s
        0x1104s
        0x1105s
        0x1110s
        0x1111s
        0x1114s
        0x1115s
        0x1140s
        0x1141s
        0x1144s
        0x1145s
        0x1150s
        0x1151s
        0x1154s
        0x1155s
        0x1400s
        0x1401s
        0x1404s
        0x1405s
        0x1410s
        0x1411s
        0x1414s
        0x1415s
        0x1440s
        0x1441s
        0x1444s
        0x1445s
        0x1450s
        0x1451s
        0x1454s
        0x1455s
        0x1500s
        0x1501s
        0x1504s
        0x1505s
        0x1510s
        0x1511s
        0x1514s
        0x1515s
        0x1540s
        0x1541s
        0x1544s
        0x1545s
        0x1550s
        0x1551s
        0x1554s
        0x1555s
        0x4000s
        0x4001s
        0x4004s
        0x4005s
        0x4010s
        0x4011s
        0x4014s
        0x4015s
        0x4040s
        0x4041s
        0x4044s
        0x4045s
        0x4050s
        0x4051s
        0x4054s
        0x4055s
        0x4100s
        0x4101s
        0x4104s
        0x4105s
        0x4110s
        0x4111s
        0x4114s
        0x4115s
        0x4140s
        0x4141s
        0x4144s
        0x4145s
        0x4150s
        0x4151s
        0x4154s
        0x4155s
        0x4400s
        0x4401s
        0x4404s
        0x4405s
        0x4410s
        0x4411s
        0x4414s
        0x4415s
        0x4440s
        0x4441s
        0x4444s
        0x4445s
        0x4450s
        0x4451s
        0x4454s
        0x4455s
        0x4500s
        0x4501s
        0x4504s
        0x4505s
        0x4510s
        0x4511s
        0x4514s
        0x4515s
        0x4540s
        0x4541s
        0x4544s
        0x4545s
        0x4550s
        0x4551s
        0x4554s
        0x4555s
        0x5000s
        0x5001s
        0x5004s
        0x5005s
        0x5010s
        0x5011s
        0x5014s
        0x5015s
        0x5040s
        0x5041s
        0x5044s
        0x5045s
        0x5050s
        0x5051s
        0x5054s
        0x5055s
        0x5100s
        0x5101s
        0x5104s
        0x5105s
        0x5110s
        0x5111s
        0x5114s
        0x5115s
        0x5140s
        0x5141s
        0x5144s
        0x5145s
        0x5150s
        0x5151s
        0x5154s
        0x5155s
        0x5400s
        0x5401s
        0x5404s
        0x5405s
        0x5410s
        0x5411s
        0x5414s
        0x5415s
        0x5440s
        0x5441s
        0x5444s
        0x5445s
        0x5450s
        0x5451s
        0x5454s
        0x5455s
        0x5500s
        0x5501s
        0x5504s
        0x5505s
        0x5510s
        0x5511s
        0x5514s
        0x5515s
        0x5540s
        0x5541s
        0x5544s
        0x5545s
        0x5550s
        0x5551s
        0x5554s
        0x5555s
    .end array-data

    .line 56
    :array_136
    .array-data 4
        0x0
        0x1
        0x8
        0x9
        0x40
        0x41
        0x48
        0x49
        0x200
        0x201
        0x208
        0x209
        0x240
        0x241
        0x248
        0x249
        0x1000
        0x1001
        0x1008
        0x1009
        0x1040
        0x1041
        0x1048
        0x1049
        0x1200
        0x1201
        0x1208
        0x1209
        0x1240
        0x1241
        0x1248
        0x1249
        0x8000
        0x8001
        0x8008
        0x8009
        0x8040
        0x8041
        0x8048
        0x8049
        0x8200
        0x8201
        0x8208
        0x8209
        0x8240
        0x8241
        0x8248
        0x8249
        0x9000
        0x9001
        0x9008
        0x9009
        0x9040
        0x9041
        0x9048
        0x9049
        0x9200
        0x9201
        0x9208
        0x9209
        0x9240
        0x9241
        0x9248
        0x9249
        0x40000
        0x40001
        0x40008
        0x40009
        0x40040
        0x40041
        0x40048
        0x40049
        0x40200
        0x40201
        0x40208
        0x40209
        0x40240
        0x40241
        0x40248
        0x40249
        0x41000
        0x41001
        0x41008
        0x41009
        0x41040
        0x41041
        0x41048
        0x41049
        0x41200
        0x41201
        0x41208
        0x41209
        0x41240
        0x41241
        0x41248
        0x41249
        0x48000
        0x48001
        0x48008
        0x48009
        0x48040
        0x48041
        0x48048
        0x48049
        0x48200
        0x48201
        0x48208
        0x48209
        0x48240
        0x48241
        0x48248
        0x48249
        0x49000    # 4.19E-40f
        0x49001    # 4.19001E-40f
        0x49008
        0x49009
        0x49040
        0x49041
        0x49048
        0x49049
        0x49200
        0x49201
        0x49208
        0x49209
        0x49240
        0x49241
        0x49248
        0x49249
    .end array-data

    .line 79
    :array_23a
    .array-data 4
        0x0
        0x1
        0x10
        0x11
        0x100
        0x101
        0x110
        0x111
        0x1000
        0x1001
        0x1010
        0x1011
        0x1100
        0x1101
        0x1110
        0x1111
        0x10000
        0x10001
        0x10010
        0x10011
        0x10100
        0x10101
        0x10110
        0x10111
        0x11000
        0x11001
        0x11010
        0x11011
        0x11100
        0x11101
        0x11110
        0x11111
        0x100000
        0x100001
        0x100010
        0x100011
        0x100100
        0x100101
        0x100110
        0x100111
        0x101000
        0x101001
        0x101010
        0x101011
        0x101100
        0x101101
        0x101110
        0x101111
        0x110000
        0x110001
        0x110010
        0x110011
        0x110100
        0x110101
        0x110110
        0x110111
        0x111000
        0x111001
        0x111010
        0x111011
        0x111100
        0x111101
        0x111110
        0x111111
        0x1000000
        0x1000001
        0x1000010
        0x1000011
        0x1000100
        0x1000101
        0x1000110
        0x1000111
        0x1001000
        0x1001001
        0x1001010
        0x1001011
        0x1001100
        0x1001101
        0x1001110
        0x1001111
        0x1010000
        0x1010001
        0x1010010
        0x1010011
        0x1010100
        0x1010101
        0x1010110
        0x1010111
        0x1011000
        0x1011001
        0x1011010
        0x1011011
        0x1011100
        0x1011101
        0x1011110
        0x1011111
        0x1100000
        0x1100001
        0x1100010
        0x1100011
        0x1100100
        0x1100101
        0x1100110
        0x1100111
        0x1101000
        0x1101001
        0x1101010
        0x1101011
        0x1101100
        0x1101101
        0x1101110
        0x1101111
        0x1110000
        0x1110001
        0x1110010
        0x1110011
        0x1110100
        0x1110101
        0x1110110
        0x1110111
        0x1111000
        0x1111001
        0x1111010
        0x1111011
        0x1111100
        0x1111101
        0x1111110
        0x1111111
        0x10000000
        0x10000001
        0x10000010
        0x10000011
        0x10000100
        0x10000101
        0x10000110
        0x10000111
        0x10001000
        0x10001001
        0x10001010
        0x10001011
        0x10001100
        0x10001101
        0x10001110
        0x10001111
        0x10010000
        0x10010001
        0x10010010
        0x10010011
        0x10010100
        0x10010101
        0x10010110
        0x10010111
        0x10011000
        0x10011001
        0x10011010
        0x10011011
        0x10011100
        0x10011101
        0x10011110
        0x10011111
        0x10100000
        0x10100001
        0x10100010
        0x10100011
        0x10100100
        0x10100101
        0x10100110
        0x10100111
        0x10101000
        0x10101001
        0x10101010
        0x10101011
        0x10101100
        0x10101101
        0x10101110
        0x10101111
        0x10110000
        0x10110001
        0x10110010
        0x10110011
        0x10110100
        0x10110101
        0x10110110
        0x10110111
        0x10111000
        0x10111001
        0x10111010
        0x10111011
        0x10111100
        0x10111101
        0x10111110
        0x10111111
        0x11000000
        0x11000001
        0x11000010
        0x11000011
        0x11000100
        0x11000101
        0x11000110
        0x11000111
        0x11001000
        0x11001001
        0x11001010
        0x11001011
        0x11001100
        0x11001101
        0x11001110
        0x11001111
        0x11010000
        0x11010001
        0x11010010
        0x11010011
        0x11010100
        0x11010101
        0x11010110
        0x11010111
        0x11011000
        0x11011001
        0x11011010
        0x11011011
        0x11011100
        0x11011101
        0x11011110
        0x11011111
        0x11100000
        0x11100001
        0x11100010
        0x11100011
        0x11100100
        0x11100101
        0x11100110
        0x11100111
        0x11101000
        0x11101001
        0x11101010
        0x11101011
        0x11101100
        0x11101101
        0x11101110
        0x11101111
        0x11110000
        0x11110001
        0x11110010
        0x11110011
        0x11110100
        0x11110101
        0x11110110
        0x11110111
        0x11111000
        0x11111001
        0x11111010
        0x11111011
        0x11111100
        0x11111101
        0x11111110
        0x11111111
    .end array-data

    .line 118
    :array_43e
    .array-data 4
        0x0
        0x1
        0x20
        0x21
        0x400
        0x401
        0x420
        0x421
        0x8000
        0x8001
        0x8020
        0x8021
        0x8400
        0x8401
        0x8420
        0x8421
        0x100000
        0x100001
        0x100020
        0x100021
        0x100400
        0x100401
        0x100420
        0x100421
        0x108000
        0x108001
        0x108020
        0x108021
        0x108400
        0x108401
        0x108420
        0x108421
        0x2000000
        0x2000001
        0x2000020
        0x2000021
        0x2000400
        0x2000401
        0x2000420
        0x2000421
        0x2008000
        0x2008001
        0x2008020
        0x2008021
        0x2008400
        0x2008401
        0x2008420
        0x2008421
        0x2100000
        0x2100001
        0x2100020
        0x2100021
        0x2100400
        0x2100401
        0x2100420
        0x2100421
        0x2108000
        0x2108001
        0x2108020
        0x2108021
        0x2108400
        0x2108401
        0x2108420
        0x2108421
        0x40000000    # 2.0f
        0x40000001    # 2.0000002f
        0x40000020    # 2.0000076f
        0x40000021    # 2.0000079f
        0x40000400    # 2.0002441f
        0x40000401    # 2.0002444f
        0x40000420    # 2.0002518f
        0x40000421    # 2.000252f
        0x40008000    # 2.0078125f
        0x40008001
        0x40008020
        0x40008021
        0x40008400
        0x40008401
        0x40008420
        0x40008421
        0x40100000    # 2.25f
        0x40100001    # 2.2500002f
        0x40100020    # 2.2500076f
        0x40100021    # 2.2500079f
        0x40100400
        0x40100401
        0x40100420
        0x40100421
        0x40108000    # 2.2578125f
        0x40108001
        0x40108020
        0x40108021
        0x40108400
        0x40108401
        0x40108420
        0x40108421
        0x42000000    # 32.0f
        0x42000001    # 32.000004f
        0x42000020    # 32.000122f
        0x42000021    # 32.000126f
        0x42000400
        0x42000401
        0x42000420
        0x42000421
        0x42008000    # 32.125f
        0x42008001
        0x42008020
        0x42008021
        0x42008400
        0x42008401
        0x42008420
        0x42008421
        0x42100000    # 36.0f
        0x42100001    # 36.000004f
        0x42100020    # 36.000122f
        0x42100021    # 36.000126f
        0x42100400
        0x42100401
        0x42100420
        0x42100421
        0x42108000    # 36.125f
        0x42108001
        0x42108020
        0x42108021
        0x42108400
        0x42108401
        0x42108420
        0x42108421
    .end array-data

    .line 140
    :array_542
    .array-data 8
        0x0
        0x1
        0x80
        0x81
        0x4000
        0x4001
        0x4080
        0x4081
        0x200000
        0x200001
        0x200080
        0x200081
        0x204000
        0x204001
        0x204080
        0x204081
        0x10000000
        0x10000001
        0x10000080
        0x10000081
        0x10004000
        0x10004001
        0x10004080
        0x10004081
        0x10200000
        0x10200001
        0x10200080
        0x10200081
        0x10204000
        0x10204001
        0x10204080
        0x10204081
        0x800000000L
        0x800000001L
        0x800000080L
        0x800000081L
        0x800004000L
        0x800004001L
        0x800004080L
        0x800004081L
        0x800200000L
        0x800200001L
        0x800200080L
        0x800200081L
        0x800204000L
        0x800204001L
        0x800204080L
        0x800204081L
        0x810000000L
        0x810000001L
        0x810000080L
        0x810000081L
        0x810004000L
        0x810004001L
        0x810004080L
        0x810004081L
        0x810200000L
        0x810200001L
        0x810200080L
        0x810200081L
        0x810204000L
        0x810204001L
        0x810204080L
        0x810204081L
        0x40000000000L
        0x40000000001L
        0x40000000080L
        0x40000000081L
        0x40000004000L
        0x40000004001L
        0x40000004080L
        0x40000004081L
        0x40000200000L
        0x40000200001L
        0x40000200080L
        0x40000200081L
        0x40000204000L
        0x40000204001L
        0x40000204080L
        0x40000204081L
        0x40010000000L
        0x40010000001L
        0x40010000080L
        0x40010000081L
        0x40010004000L
        0x40010004001L
        0x40010004080L
        0x40010004081L
        0x40010200000L
        0x40010200001L
        0x40010200080L
        0x40010200081L
        0x40010204000L
        0x40010204001L
        0x40010204080L
        0x40010204081L
        0x40800000000L
        0x40800000001L
        0x40800000080L
        0x40800000081L
        0x40800004000L
        0x40800004001L
        0x40800004080L
        0x40800004081L
        0x40800200000L
        0x40800200001L
        0x40800200080L
        0x40800200081L
        0x40800204000L
        0x40800204001L
        0x40800204080L
        0x40800204081L
        0x40810000000L
        0x40810000001L
        0x40810000080L
        0x40810000081L
        0x40810004000L
        0x40810004001L
        0x40810004080L
        0x40810004081L
        0x40810200000L
        0x40810200001L
        0x40810200080L
        0x40810200081L
        0x40810204000L
        0x40810204001L
        0x40810204080L
        0x40810204081L
        0x2000000000000L
        0x2000000000001L
        0x2000000000080L
        0x2000000000081L
        0x2000000004000L
        0x2000000004001L
        0x2000000004080L
        0x2000000004081L
        0x2000000200000L
        0x2000000200001L
        0x2000000200080L
        0x2000000200081L
        0x2000000204000L
        0x2000000204001L
        0x2000000204080L
        0x2000000204081L
        0x2000010000000L
        0x2000010000001L
        0x2000010000080L
        0x2000010000081L
        0x2000010004000L
        0x2000010004001L
        0x2000010004080L
        0x2000010004081L
        0x2000010200000L
        0x2000010200001L
        0x2000010200080L
        0x2000010200081L
        0x2000010204000L
        0x2000010204001L
        0x2000010204080L
        0x2000010204081L
        0x2000800000000L
        0x2000800000001L
        0x2000800000080L
        0x2000800000081L
        0x2000800004000L
        0x2000800004001L
        0x2000800004080L
        0x2000800004081L
        0x2000800200000L
        0x2000800200001L
        0x2000800200080L
        0x2000800200081L
        0x2000800204000L
        0x2000800204001L
        0x2000800204080L
        0x2000800204081L
        0x2000810000000L
        0x2000810000001L
        0x2000810000080L
        0x2000810000081L
        0x2000810004000L
        0x2000810004001L
        0x2000810004080L
        0x2000810004081L
        0x2000810200000L
        0x2000810200001L
        0x2000810200080L
        0x2000810200081L
        0x2000810204000L
        0x2000810204001L
        0x2000810204080L
        0x2000810204081L
        0x2040000000000L
        0x2040000000001L
        0x2040000000080L
        0x2040000000081L
        0x2040000004000L
        0x2040000004001L
        0x2040000004080L
        0x2040000004081L
        0x2040000200000L
        0x2040000200001L
        0x2040000200080L
        0x2040000200081L
        0x2040000204000L
        0x2040000204001L
        0x2040000204080L
        0x2040000204081L
        0x2040010000000L
        0x2040010000001L
        0x2040010000080L
        0x2040010000081L
        0x2040010004000L
        0x2040010004001L
        0x2040010004080L
        0x2040010004081L
        0x2040010200000L
        0x2040010200001L
        0x2040010200080L
        0x2040010200081L
        0x2040010204000L
        0x2040010204001L
        0x2040010204080L
        0x2040010204081L
        0x2040800000000L
        0x2040800000001L
        0x2040800000080L
        0x2040800000081L
        0x2040800004000L
        0x2040800004001L
        0x2040800004080L
        0x2040800004081L
        0x2040800200000L
        0x2040800200001L
        0x2040800200080L
        0x2040800200081L
        0x2040800204000L
        0x2040800204001L
        0x2040800204080L
        0x2040800204081L
        0x2040810000000L
        0x2040810000001L
        0x2040810000080L
        0x2040810000081L
        0x2040810004000L
        0x2040810004001L
        0x2040810004080L
        0x2040810004081L
        0x2040810200000L
        0x2040810200001L
        0x2040810200080L
        0x2040810200081L
        0x2040810204000L
        0x2040810204001L
        0x2040810204080L
        0x2040810204081L
        0x100000000000000L
        0x100000000000001L
        0x100000000000080L
        0x100000000000081L
        0x100000000004000L
        0x100000000004001L
        0x100000000004080L
        0x100000000004081L
        0x100000000200000L
        0x100000000200001L
        0x100000000200080L
        0x100000000200081L    # 7.2911220229518E-304
        0x100000000204000L
        0x100000000204001L
        0x100000000204080L
        0x100000000204081L
        0x100000010000000L
        0x100000010000001L
        0x100000010000080L
        0x100000010000081L
        0x100000010004000L
        0x100000010004001L
        0x100000010004080L
        0x100000010004081L
        0x100000010200000L
        0x100000010200001L
        0x100000010200080L
        0x100000010200081L
        0x100000010204000L
        0x100000010204001L
        0x100000010204080L
        0x100000010204081L
        0x100000800000000L
        0x100000800000001L
        0x100000800000080L
        0x100000800000081L
        0x100000800004000L
        0x100000800004001L
        0x100000800004080L
        0x100000800004081L
        0x100000800200000L
        0x100000800200001L
        0x100000800200080L
        0x100000800200081L
        0x100000800204000L
        0x100000800204001L
        0x100000800204080L
        0x100000800204081L
        0x100000810000000L
        0x100000810000001L    # 7.2911780809876E-304
        0x100000810000080L
        0x100000810000081L
        0x100000810004000L
        0x100000810004001L
        0x100000810004080L
        0x100000810004081L
        0x100000810200000L
        0x100000810200001L
        0x100000810200080L    # 7.291178084382999E-304
        0x100000810200081L    # 7.291178084383E-304
        0x100000810204000L
        0x100000810204001L
        0x100000810204080L
        0x100000810204081L
        0x100040000000000L
        0x100040000000001L
        0x100040000000080L
        0x100040000000081L
        0x100040000004000L
        0x100040000004001L
        0x100040000004080L
        0x100040000004081L
        0x100040000200000L
        0x100040000200001L
        0x100040000200080L
        0x100040000200081L
        0x100040000204000L
        0x100040000204001L
        0x100040000204080L
        0x100040000204081L
        0x100040010000000L
        0x100040010000001L
        0x100040010000080L
        0x100040010000081L
        0x100040010004000L
        0x100040010004001L
        0x100040010004080L
        0x100040010004081L
        0x100040010200000L
        0x100040010200001L
        0x100040010200080L
        0x100040010200081L
        0x100040010204000L
        0x100040010204001L
        0x100040010204080L
        0x100040010204081L
        0x100040800000000L
        0x100040800000001L
        0x100040800000080L
        0x100040800000081L
        0x100040800004000L
        0x100040800004001L
        0x100040800004080L
        0x100040800004081L
        0x100040800200000L
        0x100040800200001L
        0x100040800200080L
        0x100040800200081L
        0x100040800204000L
        0x100040800204001L
        0x100040800204080L
        0x100040800204081L
        0x100040810000000L
        0x100040810000001L
        0x100040810000080L
        0x100040810000081L
        0x100040810004000L
        0x100040810004001L
        0x100040810004080L
        0x100040810004081L
        0x100040810200000L
        0x100040810200001L
        0x100040810200080L
        0x100040810200081L
        0x100040810204000L
        0x100040810204001L
        0x100040810204080L
        0x100040810204081L
        0x102000000000000L    # 8.202512272000947E-304
        0x102000000000001L    # 8.202512272000949E-304
        0x102000000000080L
        0x102000000000081L
        0x102000000004000L
        0x102000000004001L
        0x102000000004080L
        0x102000000004081L
        0x102000000200000L
        0x102000000200001L
        0x102000000200080L
        0x102000000200081L
        0x102000000204000L
        0x102000000204001L
        0x102000000204080L
        0x102000000204081L
        0x102000010000000L
        0x102000010000001L
        0x102000010000080L
        0x102000010000081L
        0x102000010004000L
        0x102000010004001L
        0x102000010004080L
        0x102000010004081L
        0x102000010200000L
        0x102000010200001L
        0x102000010200080L
        0x102000010200081L
        0x102000010204000L    # 8.202512710007403E-304
        0x102000010204001L    # 8.202512710007405E-304
        0x102000010204080L    # 8.20251271000761E-304
        0x102000010204081L    # 8.202512710007612E-304
        0x102000800000000L
        0x102000800000001L
        0x102000800000080L
        0x102000800000081L
        0x102000800004000L
        0x102000800004001L
        0x102000800004080L
        0x102000800004081L
        0x102000800200000L
        0x102000800200001L
        0x102000800200080L
        0x102000800200081L
        0x102000800204000L
        0x102000800204001L
        0x102000800204080L
        0x102000800204081L
        0x102000810000000L
        0x102000810000001L
        0x102000810000080L
        0x102000810000081L
        0x102000810004000L
        0x102000810004001L
        0x102000810004080L
        0x102000810004081L
        0x102000810200000L
        0x102000810200001L
        0x102000810200080L
        0x102000810200081L
        0x102000810204000L
        0x102000810204001L
        0x102000810204080L
        0x102000810204081L
        0x102040000000000L
        0x102040000000001L
        0x102040000000080L
        0x102040000000081L
        0x102040000004000L
        0x102040000004001L
        0x102040000004080L
        0x102040000004081L
        0x102040000200000L
        0x102040000200001L
        0x102040000200080L
        0x102040000200081L
        0x102040000204000L
        0x102040000204001L
        0x102040000204080L
        0x102040000204081L
        0x102040010000000L
        0x102040010000001L
        0x102040010000080L
        0x102040010000081L
        0x102040010004000L
        0x102040010004001L
        0x102040010004080L
        0x102040010004081L
        0x102040010200000L
        0x102040010200001L
        0x102040010200080L
        0x102040010200081L
        0x102040010204000L
        0x102040010204001L
        0x102040010204080L
        0x102040010204081L
        0x102040800000000L
        0x102040800000001L
        0x102040800000080L
        0x102040800000081L
        0x102040800004000L
        0x102040800004001L
        0x102040800004080L
        0x102040800004081L
        0x102040800200000L
        0x102040800200001L
        0x102040800200080L
        0x102040800200081L
        0x102040800204000L
        0x102040800204001L
        0x102040800204080L
        0x102040800204081L
        0x102040810000000L
        0x102040810000001L
        0x102040810000080L
        0x102040810000081L
        0x102040810004000L
        0x102040810004001L
        0x102040810004080L
        0x102040810004081L
        0x102040810200000L
        0x102040810200001L
        0x102040810200080L
        0x102040810200081L
        0x102040810204000L
        0x102040810204001L
        0x102040810204080L
        0x102040810204081L
    .end array-data

    .line 275
    :array_d46
    .array-data 1
        0x0t
        0x1t
        0x2t
        0x2t
        0x3t
        0x3t
        0x3t
        0x3t
        0x4t
        0x4t
        0x4t
        0x4t
        0x4t
        0x4t
        0x4t
        0x4t
        0x5t
        0x5t
        0x5t
        0x5t
        0x5t
        0x5t
        0x5t
        0x5t
        0x5t
        0x5t
        0x5t
        0x5t
        0x5t
        0x5t
        0x5t
        0x5t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
    .end array-data
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "intLen"    # I

    .prologue
    .line 300
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 301
    new-array v0, p1, [J

    iput-object v0, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    .line 302
    return-void
.end method

.method public constructor <init>(Ljava/math/BigInteger;)V
    .registers 20
    .param p1, "bigInt"    # Ljava/math/BigInteger;

    .prologue
    .line 323
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 324
    if-eqz p1, :cond_b

    invoke-virtual/range {p1 .. p1}, Ljava/math/BigInteger;->signum()I

    move-result v14

    if-gez v14, :cond_13

    .line 326
    :cond_b
    new-instance v14, Ljava/lang/IllegalArgumentException;

    const-string v15, "invalid F2m field value"

    invoke-direct {v14, v15}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 329
    :cond_13
    invoke-virtual/range {p1 .. p1}, Ljava/math/BigInteger;->signum()I

    move-result v14

    if-nez v14, :cond_26

    .line 331
    const/4 v14, 0x1

    new-array v14, v14, [J

    const/4 v15, 0x0

    const-wide/16 v16, 0x0

    aput-wide v16, v14, v15

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    .line 374
    :cond_25
    return-void

    .line 335
    :cond_26
    invoke-virtual/range {p1 .. p1}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v1

    .line 336
    .local v1, "barr":[B
    array-length v5, v1

    .line 337
    .local v5, "barrLen":I
    const/4 v6, 0x0

    .line 338
    .local v6, "barrStart":I
    const/4 v14, 0x0

    aget-byte v14, v1, v14

    if-nez v14, :cond_34

    .line 342
    add-int/lit8 v5, v5, -0x1

    .line 343
    const/4 v6, 0x1

    .line 345
    :cond_34
    add-int/lit8 v14, v5, 0x7

    div-int/lit8 v10, v14, 0x8

    .line 346
    .local v10, "intLen":I
    new-array v14, v10, [J

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    .line 348
    add-int/lit8 v8, v10, -0x1

    .line 349
    .local v8, "iarrJ":I
    rem-int/lit8 v14, v5, 0x8

    add-int v11, v14, v6

    .line 350
    .local v11, "rem":I
    const-wide/16 v12, 0x0

    .line 351
    .local v12, "temp":J
    move v3, v6

    .line 352
    .local v3, "barrI":I
    if-ge v6, v11, :cond_60

    .line 354
    :goto_49
    if-ge v3, v11, :cond_57

    .line 356
    const/16 v14, 0x8

    shl-long/2addr v12, v14

    .line 357
    aget-byte v14, v1, v3

    and-int/lit16 v2, v14, 0xff

    .line 358
    .local v2, "barrBarrI":I
    int-to-long v14, v2

    or-long/2addr v12, v14

    .line 354
    add-int/lit8 v3, v3, 0x1

    goto :goto_49

    .line 360
    .end local v2    # "barrBarrI":I
    :cond_57
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    add-int/lit8 v9, v8, -0x1

    .end local v8    # "iarrJ":I
    .local v9, "iarrJ":I
    aput-wide v12, v14, v8

    move v8, v9

    .line 363
    .end local v9    # "iarrJ":I
    .restart local v8    # "iarrJ":I
    :cond_60
    :goto_60
    if-ltz v8, :cond_25

    .line 365
    const-wide/16 v12, 0x0

    .line 366
    const/4 v7, 0x0

    .local v7, "i":I
    move v4, v3

    .end local v3    # "barrI":I
    .local v4, "barrI":I
    :goto_66
    const/16 v14, 0x8

    if-ge v7, v14, :cond_79

    .line 368
    const/16 v14, 0x8

    shl-long/2addr v12, v14

    .line 369
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "barrI":I
    .restart local v3    # "barrI":I
    aget-byte v14, v1, v4

    and-int/lit16 v2, v14, 0xff

    .line 370
    .restart local v2    # "barrBarrI":I
    int-to-long v14, v2

    or-long/2addr v12, v14

    .line 366
    add-int/lit8 v7, v7, 0x1

    move v4, v3

    .end local v3    # "barrI":I
    .restart local v4    # "barrI":I
    goto :goto_66

    .line 372
    .end local v2    # "barrBarrI":I
    :cond_79
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    aput-wide v12, v14, v8

    .line 363
    add-int/lit8 v8, v8, -0x1

    move v3, v4

    .end local v4    # "barrI":I
    .restart local v3    # "barrI":I
    goto :goto_60
.end method

.method public constructor <init>([J)V
    .registers 2
    .param p1, "ints"    # [J

    .prologue
    .line 305
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 306
    iput-object p1, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    .line 307
    return-void
.end method

.method public constructor <init>([JII)V
    .registers 6
    .param p1, "ints"    # [J
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 310
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 311
    if-nez p2, :cond_b

    array-length v0, p1

    if-ne p3, v0, :cond_b

    .line 313
    iput-object p1, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    .line 320
    :goto_a
    return-void

    .line 317
    :cond_b
    new-array v0, p3, [J

    iput-object v0, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    .line 318
    iget-object v0, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    const/4 v1, 0x0

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_a
.end method

.method private static add([JI[JII)V
    .registers 11
    .param p0, "x"    # [J
    .param p1, "xOff"    # I
    .param p2, "y"    # [J
    .param p3, "yOff"    # I
    .param p4, "count"    # I

    .prologue
    .line 720
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p4, :cond_11

    .line 722
    add-int v1, p1, v0

    aget-wide v2, p0, v1

    add-int v4, p3, v0

    aget-wide v4, p2, v4

    xor-long/2addr v2, v4

    aput-wide v2, p0, v1

    .line 720
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 724
    :cond_11
    return-void
.end method

.method private static add([JI[JI[JII)V
    .registers 13
    .param p0, "x"    # [J
    .param p1, "xOff"    # I
    .param p2, "y"    # [J
    .param p3, "yOff"    # I
    .param p4, "z"    # [J
    .param p5, "zOff"    # I
    .param p6, "count"    # I

    .prologue
    .line 728
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p6, :cond_13

    .line 730
    add-int v1, p5, v0

    add-int v2, p1, v0

    aget-wide v2, p0, v2

    add-int v4, p3, v0

    aget-wide v4, p2, v4

    xor-long/2addr v2, v4

    aput-wide v2, p4, v1

    .line 728
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 732
    :cond_13
    return-void
.end method

.method private static addBoth([JI[JI[JII)V
    .registers 15
    .param p0, "x"    # [J
    .param p1, "xOff"    # I
    .param p2, "y1"    # [J
    .param p3, "y1Off"    # I
    .param p4, "y2"    # [J
    .param p5, "y2Off"    # I
    .param p6, "count"    # I

    .prologue
    .line 736
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p6, :cond_16

    .line 738
    add-int v1, p1, v0

    aget-wide v2, p0, v1

    add-int v4, p3, v0

    aget-wide v4, p2, v4

    add-int v6, p5, v0

    aget-wide v6, p4, v6

    xor-long/2addr v4, v6

    xor-long/2addr v2, v4

    aput-wide v2, p0, v1

    .line 736
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 740
    :cond_16
    return-void
.end method

.method private addShiftedByBitsSafe(Lorg/spongycastle/math/ec/LongArray;II)V
    .registers 14
    .param p1, "other"    # Lorg/spongycastle/math/ec/LongArray;
    .param p2, "otherDegree"    # I
    .param p3, "bits"    # I

    .prologue
    const/4 v3, 0x0

    .line 656
    add-int/lit8 v0, p2, 0x3f

    ushr-int/lit8 v4, v0, 0x6

    .line 658
    .local v4, "otherLen":I
    ushr-int/lit8 v1, p3, 0x6

    .line 659
    .local v1, "words":I
    and-int/lit8 v5, p3, 0x3f

    .line 661
    .local v5, "shift":I
    if-nez v5, :cond_13

    .line 663
    iget-object v0, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    iget-object v2, p1, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/math/ec/LongArray;->add([JI[JII)V

    .line 672
    :cond_12
    :goto_12
    return-void

    .line 667
    :cond_13
    iget-object v0, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    iget-object v2, p1, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    invoke-static/range {v0 .. v5}, Lorg/spongycastle/math/ec/LongArray;->addShiftedUp([JI[JIII)J

    move-result-wide v6

    .line 668
    .local v6, "carry":J
    const-wide/16 v2, 0x0

    cmp-long v0, v6, v2

    if-eqz v0, :cond_12

    .line 670
    iget-object v0, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    add-int v2, v4, v1

    aget-wide v8, v0, v2

    xor-long/2addr v8, v6

    aput-wide v8, v0, v2

    goto :goto_12
.end method

.method private static addShiftedDown([JI[JIII)J
    .registers 17
    .param p0, "x"    # [J
    .param p1, "xOff"    # I
    .param p2, "y"    # [J
    .param p3, "yOff"    # I
    .param p4, "count"    # I
    .param p5, "shift"    # I

    .prologue
    .line 689
    rsub-int/lit8 v5, p5, 0x40

    .line 690
    .local v5, "shiftInv":I
    const-wide/16 v3, 0x0

    .line 691
    .local v3, "prev":J
    move v0, p4

    .line 692
    .local v0, "i":I
    :goto_5
    add-int/lit8 v0, v0, -0x1

    if-ltz v0, :cond_1a

    .line 694
    add-int v6, p3, v0

    aget-wide v1, p2, v6

    .line 695
    .local v1, "next":J
    add-int v6, p1, v0

    aget-wide v7, p0, v6

    ushr-long v9, v1, p5

    or-long/2addr v9, v3

    xor-long/2addr v7, v9

    aput-wide v7, p0, v6

    .line 696
    shl-long v3, v1, v5

    .line 697
    goto :goto_5

    .line 698
    .end local v1    # "next":J
    :cond_1a
    return-wide v3
.end method

.method private static addShiftedUp([JI[JIII)J
    .registers 17
    .param p0, "x"    # [J
    .param p1, "xOff"    # I
    .param p2, "y"    # [J
    .param p3, "yOff"    # I
    .param p4, "count"    # I
    .param p5, "shift"    # I

    .prologue
    .line 676
    rsub-int/lit8 v5, p5, 0x40

    .line 677
    .local v5, "shiftInv":I
    const-wide/16 v3, 0x0

    .line 678
    .local v3, "prev":J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    if-ge v0, p4, :cond_1a

    .line 680
    add-int v6, p3, v0

    aget-wide v1, p2, v6

    .line 681
    .local v1, "next":J
    add-int v6, p1, v0

    aget-wide v7, p0, v6

    shl-long v9, v1, p5

    or-long/2addr v9, v3

    xor-long/2addr v7, v9

    aput-wide v7, p0, v6

    .line 682
    ushr-long v3, v1, v5

    .line 678
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 684
    .end local v1    # "next":J
    :cond_1a
    return-wide v3
.end method

.method private static bitLength(J)I
    .registers 9
    .param p0, "w"    # J

    .prologue
    .line 502
    const/16 v5, 0x20

    ushr-long v5, p0, v5

    long-to-int v3, v5

    .line 503
    .local v3, "u":I
    if-nez v3, :cond_18

    .line 505
    long-to-int v3, p0

    .line 506
    const/4 v0, 0x0

    .line 513
    .local v0, "b":I
    :goto_9
    ushr-int/lit8 v2, v3, 0x10

    .line 514
    .local v2, "t":I
    if-nez v2, :cond_22

    .line 516
    ushr-int/lit8 v2, v3, 0x8

    .line 517
    if-nez v2, :cond_1b

    sget-object v5, Lorg/spongycastle/math/ec/LongArray;->bitLengths:[B

    aget-byte v1, v5, v3

    .line 525
    .local v1, "k":I
    :goto_15
    add-int v5, v0, v1

    return v5

    .line 510
    .end local v0    # "b":I
    .end local v1    # "k":I
    .end local v2    # "t":I
    :cond_18
    const/16 v0, 0x20

    .restart local v0    # "b":I
    goto :goto_9

    .line 517
    .restart local v2    # "t":I
    :cond_1b
    sget-object v5, Lorg/spongycastle/math/ec/LongArray;->bitLengths:[B

    aget-byte v5, v5, v2

    add-int/lit8 v1, v5, 0x8

    goto :goto_15

    .line 521
    :cond_22
    ushr-int/lit8 v4, v2, 0x8

    .line 522
    .local v4, "v":I
    if-nez v4, :cond_2d

    sget-object v5, Lorg/spongycastle/math/ec/LongArray;->bitLengths:[B

    aget-byte v5, v5, v2

    add-int/lit8 v1, v5, 0x10

    .restart local v1    # "k":I
    :goto_2c
    goto :goto_15

    .end local v1    # "k":I
    :cond_2d
    sget-object v5, Lorg/spongycastle/math/ec/LongArray;->bitLengths:[B

    aget-byte v5, v5, v4

    add-int/lit8 v1, v5, 0x18

    goto :goto_2c
.end method

.method private degreeFrom(I)I
    .registers 7
    .param p1, "limit"    # I

    .prologue
    .line 461
    add-int/lit8 v3, p1, 0x3e

    ushr-int/lit8 v0, v3, 0x6

    .line 465
    .local v0, "i":I
    :cond_4
    if-nez v0, :cond_8

    .line 467
    const/4 v3, 0x0

    .line 473
    :goto_7
    return v3

    .line 469
    :cond_8
    iget-object v3, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    add-int/lit8 v0, v0, -0x1

    aget-wide v1, v3, v0

    .line 471
    .local v1, "w":J
    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-eqz v3, :cond_4

    .line 473
    shl-int/lit8 v3, v0, 0x6

    invoke-static {v1, v2}, Lorg/spongycastle/math/ec/LongArray;->bitLength(J)I

    move-result v4

    add-int/2addr v3, v4

    goto :goto_7
.end method

.method private static distribute([JIIII)V
    .registers 11
    .param p0, "x"    # [J
    .param p1, "src"    # I
    .param p2, "dst1"    # I
    .param p3, "dst2"    # I
    .param p4, "count"    # I

    .prologue
    .line 744
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p4, :cond_18

    .line 746
    add-int v3, p1, v0

    aget-wide v1, p0, v3

    .line 747
    .local v1, "v":J
    add-int v3, p2, v0

    aget-wide v4, p0, v3

    xor-long/2addr v4, v1

    aput-wide v4, p0, v3

    .line 748
    add-int v3, p3, v0

    aget-wide v4, p0, v3

    xor-long/2addr v4, v1

    aput-wide v4, p0, v3

    .line 744
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 750
    .end local v1    # "v":J
    :cond_18
    return-void
.end method

.method private static flipBit([JII)V
    .registers 10
    .param p0, "buf"    # [J
    .param p1, "off"    # I
    .param p2, "n"    # I

    .prologue
    .line 810
    ushr-int/lit8 v3, p2, 0x6

    .line 812
    .local v3, "theInt":I
    and-int/lit8 v2, p2, 0x3f

    .line 813
    .local v2, "theBit":I
    const-wide/16 v4, 0x1

    shl-long v0, v4, v2

    .line 814
    .local v0, "flipper":J
    add-int v4, p1, v3

    aget-wide v5, p0, v4

    xor-long/2addr v5, v0

    aput-wide v5, p0, v4

    .line 815
    return-void
.end method

.method private static flipVector([JI[JIII)V
    .registers 14
    .param p0, "x"    # [J
    .param p1, "xOff"    # I
    .param p2, "y"    # [J
    .param p3, "yOff"    # I
    .param p4, "yLen"    # I
    .param p5, "bits"    # I

    .prologue
    .line 1645
    ushr-int/lit8 v0, p5, 0x6

    add-int/2addr p1, v0

    .line 1646
    and-int/lit8 p5, p5, 0x3f

    .line 1648
    if-nez p5, :cond_b

    .line 1650
    invoke-static {p0, p1, p2, p3, p4}, Lorg/spongycastle/math/ec/LongArray;->add([JI[JII)V

    .line 1657
    :goto_a
    return-void

    .line 1654
    :cond_b
    add-int/lit8 v1, p1, 0x1

    rsub-int/lit8 v5, p5, 0x40

    move-object v0, p0

    move-object v2, p2

    move v3, p3

    move v4, p4

    invoke-static/range {v0 .. v5}, Lorg/spongycastle/math/ec/LongArray;->addShiftedDown([JI[JIII)J

    move-result-wide v6

    .line 1655
    .local v6, "carry":J
    aget-wide v0, p0, p1

    xor-long/2addr v0, v6

    aput-wide v0, p0, p1

    goto :goto_a
.end method

.method private static flipWord([JIIJ)V
    .registers 11
    .param p0, "buf"    # [J
    .param p1, "off"    # I
    .param p2, "bit"    # I
    .param p3, "word"    # J

    .prologue
    .line 759
    ushr-int/lit8 v2, p2, 0x6

    add-int v0, p1, v2

    .line 760
    .local v0, "n":I
    and-int/lit8 v1, p2, 0x3f

    .line 761
    .local v1, "shift":I
    if-nez v1, :cond_e

    .line 763
    aget-wide v2, p0, v0

    xor-long/2addr v2, p3

    aput-wide v2, p0, v0

    .line 774
    :cond_d
    :goto_d
    return-void

    .line 767
    :cond_e
    aget-wide v2, p0, v0

    shl-long v4, p3, v1

    xor-long/2addr v2, v4

    aput-wide v2, p0, v0

    .line 768
    rsub-int/lit8 v2, v1, 0x40

    ushr-long/2addr p3, v2

    .line 769
    const-wide/16 v2, 0x0

    cmp-long v2, p3, v2

    if-eqz v2, :cond_d

    .line 771
    add-int/lit8 v0, v0, 0x1

    aget-wide v2, p0, v0

    xor-long/2addr v2, p3

    aput-wide v2, p0, v0

    goto :goto_d
.end method

.method private static interleave([JI[JIII)V
    .registers 12
    .param p0, "x"    # [J
    .param p1, "xOff"    # I
    .param p2, "z"    # [J
    .param p3, "zOff"    # I
    .param p4, "count"    # I
    .param p5, "width"    # I

    .prologue
    .line 1737
    packed-switch p5, :pswitch_data_1e

    .line 1749
    :pswitch_3
    sget-object v0, Lorg/spongycastle/math/ec/LongArray;->bitLengths:[B

    aget-byte v0, v0, p5

    add-int/lit8 v5, v0, -0x1

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    invoke-static/range {v0 .. v5}, Lorg/spongycastle/math/ec/LongArray;->interleave2_n([JI[JIII)V

    .line 1752
    :goto_11
    return-void

    .line 1740
    :pswitch_12
    invoke-static {p0, p1, p2, p3, p4}, Lorg/spongycastle/math/ec/LongArray;->interleave3([JI[JII)V

    goto :goto_11

    .line 1743
    :pswitch_16
    invoke-static {p0, p1, p2, p3, p4}, Lorg/spongycastle/math/ec/LongArray;->interleave5([JI[JII)V

    goto :goto_11

    .line 1746
    :pswitch_1a
    invoke-static {p0, p1, p2, p3, p4}, Lorg/spongycastle/math/ec/LongArray;->interleave7([JI[JII)V

    goto :goto_11

    .line 1737
    :pswitch_data_1e
    .packed-switch 0x3
        :pswitch_12
        :pswitch_3
        :pswitch_16
        :pswitch_3
        :pswitch_1a
    .end packed-switch
.end method

.method private static interleave2_32to64(I)J
    .registers 9
    .param p0, "x"    # I

    .prologue
    const-wide v6, 0xffffffffL

    .line 1902
    sget-object v2, Lorg/spongycastle/math/ec/LongArray;->INTERLEAVE2_TABLE:[S

    and-int/lit16 v3, p0, 0xff

    aget-short v2, v2, v3

    sget-object v3, Lorg/spongycastle/math/ec/LongArray;->INTERLEAVE2_TABLE:[S

    ushr-int/lit8 v4, p0, 0x8

    and-int/lit16 v4, v4, 0xff

    aget-short v3, v3, v4

    shl-int/lit8 v3, v3, 0x10

    or-int v0, v2, v3

    .line 1903
    .local v0, "r00":I
    sget-object v2, Lorg/spongycastle/math/ec/LongArray;->INTERLEAVE2_TABLE:[S

    ushr-int/lit8 v3, p0, 0x10

    and-int/lit16 v3, v3, 0xff

    aget-short v2, v2, v3

    sget-object v3, Lorg/spongycastle/math/ec/LongArray;->INTERLEAVE2_TABLE:[S

    ushr-int/lit8 v4, p0, 0x18

    aget-short v3, v3, v4

    shl-int/lit8 v3, v3, 0x10

    or-int v1, v2, v3

    .line 1904
    .local v1, "r32":I
    int-to-long v2, v1

    and-long/2addr v2, v6

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    int-to-long v4, v0

    and-long/2addr v4, v6

    or-long/2addr v2, v4

    return-wide v2
.end method

.method private static interleave2_n(JI)J
    .registers 11
    .param p0, "x"    # J
    .param p2, "rounds"    # I

    .prologue
    const/16 v7, 0x20

    const/4 v6, 0x1

    const v5, 0xffff

    .line 1878
    :goto_6
    if-le p2, v6, :cond_36

    .line 1880
    add-int/lit8 p2, p2, -0x2

    .line 1881
    long-to-int v0, p0

    and-int/2addr v0, v5

    invoke-static {v0}, Lorg/spongycastle/math/ec/LongArray;->interleave4_16to64(I)J

    move-result-wide v0

    const/16 v2, 0x10

    ushr-long v2, p0, v2

    long-to-int v2, v2

    and-int/2addr v2, v5

    .line 1882
    invoke-static {v2}, Lorg/spongycastle/math/ec/LongArray;->interleave4_16to64(I)J

    move-result-wide v2

    shl-long/2addr v2, v6

    or-long/2addr v0, v2

    ushr-long v2, p0, v7

    long-to-int v2, v2

    and-int/2addr v2, v5

    .line 1883
    invoke-static {v2}, Lorg/spongycastle/math/ec/LongArray;->interleave4_16to64(I)J

    move-result-wide v2

    const/4 v4, 0x2

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    const/16 v2, 0x30

    ushr-long v2, p0, v2

    long-to-int v2, v2

    and-int/2addr v2, v5

    .line 1884
    invoke-static {v2}, Lorg/spongycastle/math/ec/LongArray;->interleave4_16to64(I)J

    move-result-wide v2

    const/4 v4, 0x3

    shl-long/2addr v2, v4

    or-long p0, v0, v2

    goto :goto_6

    .line 1886
    :cond_36
    if-lez p2, :cond_47

    .line 1888
    long-to-int v0, p0

    invoke-static {v0}, Lorg/spongycastle/math/ec/LongArray;->interleave2_32to64(I)J

    move-result-wide v0

    ushr-long v2, p0, v7

    long-to-int v2, v2

    invoke-static {v2}, Lorg/spongycastle/math/ec/LongArray;->interleave2_32to64(I)J

    move-result-wide v2

    shl-long/2addr v2, v6

    or-long p0, v0, v2

    .line 1890
    :cond_47
    return-wide p0
.end method

.method private static interleave2_n([JI[JIII)V
    .registers 10
    .param p0, "x"    # [J
    .param p1, "xOff"    # I
    .param p2, "z"    # [J
    .param p3, "zOff"    # I
    .param p4, "count"    # I
    .param p5, "rounds"    # I

    .prologue
    .line 1870
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p4, :cond_12

    .line 1872
    add-int v1, p3, v0

    add-int v2, p1, v0

    aget-wide v2, p0, v2

    invoke-static {v2, v3, p5}, Lorg/spongycastle/math/ec/LongArray;->interleave2_n(JI)J

    move-result-wide v2

    aput-wide v2, p2, v1

    .line 1870
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1874
    :cond_12
    return-void
.end method

.method private static interleave3(J)J
    .registers 10
    .param p0, "x"    # J

    .prologue
    const v7, 0x1fffff

    .line 1764
    const-wide/high16 v2, -0x8000000000000000L

    and-long v0, p0, v2

    .line 1765
    .local v0, "z":J
    long-to-int v2, p0

    and-int/2addr v2, v7

    .line 1766
    invoke-static {v2}, Lorg/spongycastle/math/ec/LongArray;->interleave3_21to63(I)J

    move-result-wide v2

    or-long/2addr v2, v0

    const/16 v4, 0x15

    ushr-long v4, p0, v4

    long-to-int v4, v4

    and-int/2addr v4, v7

    .line 1767
    invoke-static {v4}, Lorg/spongycastle/math/ec/LongArray;->interleave3_21to63(I)J

    move-result-wide v4

    const/4 v6, 0x1

    shl-long/2addr v4, v6

    or-long/2addr v2, v4

    const/16 v4, 0x2a

    ushr-long v4, p0, v4

    long-to-int v4, v4

    and-int/2addr v4, v7

    .line 1768
    invoke-static {v4}, Lorg/spongycastle/math/ec/LongArray;->interleave3_21to63(I)J

    move-result-wide v4

    const/4 v6, 0x2

    shl-long/2addr v4, v6

    or-long/2addr v2, v4

    return-wide v2
.end method

.method private static interleave3([JI[JII)V
    .registers 9
    .param p0, "x"    # [J
    .param p1, "xOff"    # I
    .param p2, "z"    # [J
    .param p3, "zOff"    # I
    .param p4, "count"    # I

    .prologue
    .line 1756
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p4, :cond_12

    .line 1758
    add-int v1, p3, v0

    add-int v2, p1, v0

    aget-wide v2, p0, v2

    invoke-static {v2, v3}, Lorg/spongycastle/math/ec/LongArray;->interleave3(J)J

    move-result-wide v2

    aput-wide v2, p2, v1

    .line 1756
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1760
    :cond_12
    return-void
.end method

.method private static interleave3_13to65(I)J
    .registers 9
    .param p0, "x"    # I

    .prologue
    const-wide v6, 0xffffffffL

    .line 1828
    sget-object v2, Lorg/spongycastle/math/ec/LongArray;->INTERLEAVE5_TABLE:[I

    and-int/lit8 v3, p0, 0x7f

    aget v0, v2, v3

    .line 1829
    .local v0, "r00":I
    sget-object v2, Lorg/spongycastle/math/ec/LongArray;->INTERLEAVE5_TABLE:[I

    ushr-int/lit8 v3, p0, 0x7

    aget v1, v2, v3

    .line 1830
    .local v1, "r35":I
    int-to-long v2, v1

    and-long/2addr v2, v6

    const/16 v4, 0x23

    shl-long/2addr v2, v4

    int-to-long v4, v0

    and-long/2addr v4, v6

    or-long/2addr v2, v4

    return-wide v2
.end method

.method private static interleave3_21to63(I)J
    .registers 11
    .param p0, "x"    # I

    .prologue
    const-wide v8, 0xffffffffL

    .line 1788
    sget-object v3, Lorg/spongycastle/math/ec/LongArray;->INTERLEAVE3_TABLE:[I

    and-int/lit8 v4, p0, 0x7f

    aget v0, v3, v4

    .line 1789
    .local v0, "r00":I
    sget-object v3, Lorg/spongycastle/math/ec/LongArray;->INTERLEAVE3_TABLE:[I

    ushr-int/lit8 v4, p0, 0x7

    and-int/lit8 v4, v4, 0x7f

    aget v1, v3, v4

    .line 1790
    .local v1, "r21":I
    sget-object v3, Lorg/spongycastle/math/ec/LongArray;->INTERLEAVE3_TABLE:[I

    ushr-int/lit8 v4, p0, 0xe

    aget v2, v3, v4

    .line 1791
    .local v2, "r42":I
    int-to-long v3, v2

    and-long/2addr v3, v8

    const/16 v5, 0x2a

    shl-long/2addr v3, v5

    int-to-long v5, v1

    and-long/2addr v5, v8

    const/16 v7, 0x15

    shl-long/2addr v5, v7

    or-long/2addr v3, v5

    int-to-long v5, v0

    and-long/2addr v5, v8

    or-long/2addr v3, v5

    return-wide v3
.end method

.method private static interleave4_16to64(I)J
    .registers 9
    .param p0, "x"    # I

    .prologue
    const-wide v6, 0xffffffffL

    .line 1895
    sget-object v2, Lorg/spongycastle/math/ec/LongArray;->INTERLEAVE4_TABLE:[I

    and-int/lit16 v3, p0, 0xff

    aget v0, v2, v3

    .line 1896
    .local v0, "r00":I
    sget-object v2, Lorg/spongycastle/math/ec/LongArray;->INTERLEAVE4_TABLE:[I

    ushr-int/lit8 v3, p0, 0x8

    aget v1, v2, v3

    .line 1897
    .local v1, "r32":I
    int-to-long v2, v1

    and-long/2addr v2, v6

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    int-to-long v4, v0

    and-long/2addr v4, v6

    or-long/2addr v2, v4

    return-wide v2
.end method

.method private static interleave5(J)J
    .registers 7
    .param p0, "x"    # J

    .prologue
    .line 1804
    long-to-int v0, p0

    and-int/lit16 v0, v0, 0x1fff

    invoke-static {v0}, Lorg/spongycastle/math/ec/LongArray;->interleave3_13to65(I)J

    move-result-wide v0

    const/16 v2, 0xd

    ushr-long v2, p0, v2

    long-to-int v2, v2

    and-int/lit16 v2, v2, 0x1fff

    .line 1805
    invoke-static {v2}, Lorg/spongycastle/math/ec/LongArray;->interleave3_13to65(I)J

    move-result-wide v2

    const/4 v4, 0x1

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    const/16 v2, 0x1a

    ushr-long v2, p0, v2

    long-to-int v2, v2

    and-int/lit16 v2, v2, 0x1fff

    .line 1806
    invoke-static {v2}, Lorg/spongycastle/math/ec/LongArray;->interleave3_13to65(I)J

    move-result-wide v2

    const/4 v4, 0x2

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    const/16 v2, 0x27

    ushr-long v2, p0, v2

    long-to-int v2, v2

    and-int/lit16 v2, v2, 0x1fff

    .line 1807
    invoke-static {v2}, Lorg/spongycastle/math/ec/LongArray;->interleave3_13to65(I)J

    move-result-wide v2

    const/4 v4, 0x3

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    const/16 v2, 0x34

    ushr-long v2, p0, v2

    long-to-int v2, v2

    and-int/lit16 v2, v2, 0x1fff

    .line 1808
    invoke-static {v2}, Lorg/spongycastle/math/ec/LongArray;->interleave3_13to65(I)J

    move-result-wide v2

    const/4 v4, 0x4

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method private static interleave5([JI[JII)V
    .registers 9
    .param p0, "x"    # [J
    .param p1, "xOff"    # I
    .param p2, "z"    # [J
    .param p3, "zOff"    # I
    .param p4, "count"    # I

    .prologue
    .line 1796
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p4, :cond_12

    .line 1798
    add-int v1, p3, v0

    add-int v2, p1, v0

    aget-wide v2, p0, v2

    invoke-static {v2, v3}, Lorg/spongycastle/math/ec/LongArray;->interleave5(J)J

    move-result-wide v2

    aput-wide v2, p2, v1

    .line 1796
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1800
    :cond_12
    return-void
.end method

.method private static interleave7(J)J
    .registers 9
    .param p0, "x"    # J

    .prologue
    .line 1843
    const-wide/high16 v2, -0x8000000000000000L

    and-long v0, p0, v2

    .line 1844
    .local v0, "z":J
    sget-object v2, Lorg/spongycastle/math/ec/LongArray;->INTERLEAVE7_TABLE:[J

    long-to-int v3, p0

    and-int/lit16 v3, v3, 0x1ff

    aget-wide v2, v2, v3

    or-long/2addr v2, v0

    sget-object v4, Lorg/spongycastle/math/ec/LongArray;->INTERLEAVE7_TABLE:[J

    const/16 v5, 0x9

    ushr-long v5, p0, v5

    long-to-int v5, v5

    and-int/lit16 v5, v5, 0x1ff

    aget-wide v4, v4, v5

    const/4 v6, 0x1

    shl-long/2addr v4, v6

    or-long/2addr v2, v4

    sget-object v4, Lorg/spongycastle/math/ec/LongArray;->INTERLEAVE7_TABLE:[J

    const/16 v5, 0x12

    ushr-long v5, p0, v5

    long-to-int v5, v5

    and-int/lit16 v5, v5, 0x1ff

    aget-wide v4, v4, v5

    const/4 v6, 0x2

    shl-long/2addr v4, v6

    or-long/2addr v2, v4

    sget-object v4, Lorg/spongycastle/math/ec/LongArray;->INTERLEAVE7_TABLE:[J

    const/16 v5, 0x1b

    ushr-long v5, p0, v5

    long-to-int v5, v5

    and-int/lit16 v5, v5, 0x1ff

    aget-wide v4, v4, v5

    const/4 v6, 0x3

    shl-long/2addr v4, v6

    or-long/2addr v2, v4

    sget-object v4, Lorg/spongycastle/math/ec/LongArray;->INTERLEAVE7_TABLE:[J

    const/16 v5, 0x24

    ushr-long v5, p0, v5

    long-to-int v5, v5

    and-int/lit16 v5, v5, 0x1ff

    aget-wide v4, v4, v5

    const/4 v6, 0x4

    shl-long/2addr v4, v6

    or-long/2addr v2, v4

    sget-object v4, Lorg/spongycastle/math/ec/LongArray;->INTERLEAVE7_TABLE:[J

    const/16 v5, 0x2d

    ushr-long v5, p0, v5

    long-to-int v5, v5

    and-int/lit16 v5, v5, 0x1ff

    aget-wide v4, v4, v5

    const/4 v6, 0x5

    shl-long/2addr v4, v6

    or-long/2addr v2, v4

    sget-object v4, Lorg/spongycastle/math/ec/LongArray;->INTERLEAVE7_TABLE:[J

    const/16 v5, 0x36

    ushr-long v5, p0, v5

    long-to-int v5, v5

    and-int/lit16 v5, v5, 0x1ff

    aget-wide v4, v4, v5

    const/4 v6, 0x6

    shl-long/2addr v4, v6

    or-long/2addr v2, v4

    return-wide v2
.end method

.method private static interleave7([JI[JII)V
    .registers 9
    .param p0, "x"    # [J
    .param p1, "xOff"    # I
    .param p2, "z"    # [J
    .param p3, "zOff"    # I
    .param p4, "count"    # I

    .prologue
    .line 1835
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p4, :cond_12

    .line 1837
    add-int v1, p3, v0

    add-int v2, p1, v0

    aget-wide v2, p0, v2

    invoke-static {v2, v3}, Lorg/spongycastle/math/ec/LongArray;->interleave7(J)J

    move-result-wide v2

    aput-wide v2, p2, v1

    .line 1835
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1839
    :cond_12
    return-void
.end method

.method private static multiplyWord(J[JI[JI)V
    .registers 14
    .param p0, "a"    # J
    .param p2, "b"    # [J
    .param p3, "bLen"    # I
    .param p4, "c"    # [J
    .param p5, "cOff"    # I

    .prologue
    .line 839
    const-wide/16 v0, 0x1

    and-long/2addr v0, p0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_d

    .line 841
    const/4 v0, 0x0

    invoke-static {p4, p5, p2, v0, p3}, Lorg/spongycastle/math/ec/LongArray;->add([JI[JII)V

    .line 843
    :cond_d
    const/4 v5, 0x1

    .line 844
    .local v5, "k":I
    :goto_e
    const/4 v0, 0x1

    ushr-long/2addr p0, v0

    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-eqz v0, :cond_38

    .line 846
    const-wide/16 v0, 0x1

    and-long/2addr v0, p0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_35

    .line 848
    const/4 v3, 0x0

    move-object v0, p4

    move v1, p5

    move-object v2, p2

    move v4, p3

    invoke-static/range {v0 .. v5}, Lorg/spongycastle/math/ec/LongArray;->addShiftedUp([JI[JIII)J

    move-result-wide v6

    .line 849
    .local v6, "carry":J
    const-wide/16 v0, 0x0

    cmp-long v0, v6, v0

    if-eqz v0, :cond_35

    .line 851
    add-int v0, p5, p3

    aget-wide v1, p4, v0

    xor-long/2addr v1, v6

    aput-wide v1, p4, v0

    .line 854
    .end local v6    # "carry":J
    :cond_35
    add-int/lit8 v5, v5, 0x1

    goto :goto_e

    .line 856
    :cond_38
    return-void
.end method

.method private static reduceBit([JIII[I)V
    .registers 8
    .param p0, "buf"    # [J
    .param p1, "off"    # I
    .param p2, "bit"    # I
    .param p3, "m"    # I
    .param p4, "ks"    # [I

    .prologue
    .line 1581
    invoke-static {p0, p1, p2}, Lorg/spongycastle/math/ec/LongArray;->flipBit([JII)V

    .line 1582
    sub-int v1, p2, p3

    .line 1583
    .local v1, "n":I
    array-length v0, p4

    .line 1584
    .local v0, "j":I
    :goto_6
    add-int/lit8 v0, v0, -0x1

    if-ltz v0, :cond_11

    .line 1586
    aget v2, p4, v0

    add-int/2addr v2, v1

    invoke-static {p0, p1, v2}, Lorg/spongycastle/math/ec/LongArray;->flipBit([JII)V

    goto :goto_6

    .line 1588
    :cond_11
    invoke-static {p0, p1, v1}, Lorg/spongycastle/math/ec/LongArray;->flipBit([JII)V

    .line 1589
    return-void
.end method

.method private static reduceBitWise([JIII[I)V
    .registers 6
    .param p0, "buf"    # [J
    .param p1, "off"    # I
    .param p2, "bitlength"    # I
    .param p3, "m"    # I
    .param p4, "ks"    # [I

    .prologue
    .line 1570
    :cond_0
    :goto_0
    add-int/lit8 p2, p2, -0x1

    if-lt p2, p3, :cond_e

    .line 1572
    invoke-static {p0, p1, p2}, Lorg/spongycastle/math/ec/LongArray;->testBit([JII)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1574
    invoke-static {p0, p1, p2, p3, p4}, Lorg/spongycastle/math/ec/LongArray;->reduceBit([JIII[I)V

    goto :goto_0

    .line 1577
    :cond_e
    return-void
.end method

.method private static reduceInPlace([JIII[I)I
    .registers 27
    .param p0, "buf"    # [J
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "m"    # I
    .param p4, "ks"    # [I

    .prologue
    .line 1526
    add-int/lit8 v5, p3, 0x3f

    ushr-int/lit8 v19, v5, 0x6

    .line 1527
    .local v19, "mLen":I
    move/from16 v0, p2

    move/from16 v1, v19

    if-ge v0, v1, :cond_d

    move/from16 v19, p2

    .line 1565
    .end local v19    # "mLen":I
    :cond_c
    :goto_c
    return v19

    .line 1532
    .restart local v19    # "mLen":I
    :cond_d
    shl-int/lit8 v5, p2, 0x6

    shl-int/lit8 v6, p3, 0x1

    add-int/lit8 v6, v6, -0x1

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v20

    .line 1533
    .local v20, "numBits":I
    shl-int/lit8 v5, p2, 0x6

    sub-int v15, v5, v20

    .line 1534
    .local v15, "excessBits":I
    :goto_1b
    const/16 v5, 0x40

    if-lt v15, v5, :cond_24

    .line 1536
    add-int/lit8 p2, p2, -0x1

    .line 1537
    add-int/lit8 v15, v15, -0x40

    goto :goto_1b

    .line 1540
    :cond_24
    move-object/from16 v0, p4

    array-length v0, v0

    move/from16 v16, v0

    .local v16, "kLen":I
    add-int/lit8 v5, v16, -0x1

    aget v17, p4, v5

    .local v17, "kMax":I
    const/4 v5, 0x1

    move/from16 v0, v16

    if-le v0, v5, :cond_6a

    add-int/lit8 v5, v16, -0x2

    aget v18, p4, v5

    .line 1541
    .local v18, "kNext":I
    :goto_36
    add-int/lit8 v5, v17, 0x40

    move/from16 v0, p3

    invoke-static {v0, v5}, Ljava/lang/Math;->max(II)I

    move-result v12

    .line 1542
    .local v12, "wordWiseLimit":I
    sub-int v5, v20, v12

    sub-int v6, p3, v18

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v5

    add-int/2addr v5, v15

    shr-int/lit8 v21, v5, 0x6

    .line 1543
    .local v21, "vectorableWords":I
    const/4 v5, 0x1

    move/from16 v0, v21

    if-le v0, v5, :cond_6f

    .line 1545
    sub-int v8, p2, v21

    .local v8, "vectorWiseWords":I
    move-object/from16 v5, p0

    move/from16 v6, p1

    move/from16 v7, p2

    move/from16 v9, p3

    move-object/from16 v10, p4

    .line 1546
    invoke-static/range {v5 .. v10}, Lorg/spongycastle/math/ec/LongArray;->reduceVectorWise([JIIII[I)V

    .line 1547
    :goto_5d
    move/from16 v0, p2

    if-le v0, v8, :cond_6d

    .line 1549
    add-int/lit8 p2, p2, -0x1

    add-int v5, p1, p2

    const-wide/16 v6, 0x0

    aput-wide v6, p0, v5

    goto :goto_5d

    .line 1540
    .end local v8    # "vectorWiseWords":I
    .end local v12    # "wordWiseLimit":I
    .end local v18    # "kNext":I
    .end local v21    # "vectorableWords":I
    :cond_6a
    const/16 v18, 0x0

    goto :goto_36

    .line 1551
    .restart local v8    # "vectorWiseWords":I
    .restart local v12    # "wordWiseLimit":I
    .restart local v18    # "kNext":I
    .restart local v21    # "vectorableWords":I
    :cond_6d
    shl-int/lit8 v20, v8, 0x6

    .line 1554
    .end local v8    # "vectorWiseWords":I
    :cond_6f
    move/from16 v0, v20

    if-le v0, v12, :cond_82

    move-object/from16 v9, p0

    move/from16 v10, p1

    move/from16 v11, p2

    move/from16 v13, p3

    move-object/from16 v14, p4

    .line 1556
    invoke-static/range {v9 .. v14}, Lorg/spongycastle/math/ec/LongArray;->reduceWordWise([JIIII[I)V

    .line 1557
    move/from16 v20, v12

    .line 1560
    :cond_82
    move/from16 v0, v20

    move/from16 v1, p3

    if-le v0, v1, :cond_c

    .line 1562
    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, v20

    move/from16 v3, p3

    move-object/from16 v4, p4

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/math/ec/LongArray;->reduceBitWise([JIII[I)V

    goto/16 :goto_c
.end method

.method private static reduceResult([JIII[I)Lorg/spongycastle/math/ec/LongArray;
    .registers 7
    .param p0, "buf"    # [J
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "m"    # I
    .param p4, "ks"    # [I

    .prologue
    .line 1493
    invoke-static {p0, p1, p2, p3, p4}, Lorg/spongycastle/math/ec/LongArray;->reduceInPlace([JIII[I)I

    move-result v0

    .line 1494
    .local v0, "rLen":I
    new-instance v1, Lorg/spongycastle/math/ec/LongArray;

    invoke-direct {v1, p0, p1, v0}, Lorg/spongycastle/math/ec/LongArray;-><init>([JII)V

    return-object v1
.end method

.method private static reduceVectorWise([JIIII[I)V
    .registers 14
    .param p0, "buf"    # [J
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "words"    # I
    .param p4, "m"    # I
    .param p5, "ks"    # [I

    .prologue
    .line 1634
    shl-int/lit8 v0, p3, 0x6

    sub-int v6, v0, p4

    .line 1635
    .local v6, "baseBit":I
    array-length v7, p5

    .line 1636
    .local v7, "j":I
    :goto_5
    add-int/lit8 v7, v7, -0x1

    if-ltz v7, :cond_18

    .line 1638
    add-int v3, p1, p3

    sub-int v4, p2, p3

    aget v0, p5, v7

    add-int v5, v6, v0

    move-object v0, p0

    move v1, p1

    move-object v2, p0

    invoke-static/range {v0 .. v5}, Lorg/spongycastle/math/ec/LongArray;->flipVector([JI[JIII)V

    goto :goto_5

    .line 1640
    :cond_18
    add-int v3, p1, p3

    sub-int v4, p2, p3

    move-object v0, p0

    move v1, p1

    move-object v2, p0

    move v5, v6

    invoke-static/range {v0 .. v5}, Lorg/spongycastle/math/ec/LongArray;->flipVector([JI[JIII)V

    .line 1641
    return-void
.end method

.method private static reduceWord([JIIJI[I)V
    .registers 10
    .param p0, "buf"    # [J
    .param p1, "off"    # I
    .param p2, "bit"    # I
    .param p3, "word"    # J
    .param p5, "m"    # I
    .param p6, "ks"    # [I

    .prologue
    .line 1618
    sub-int v1, p2, p5

    .line 1619
    .local v1, "offset":I
    array-length v0, p6

    .line 1620
    .local v0, "j":I
    :goto_3
    add-int/lit8 v0, v0, -0x1

    if-ltz v0, :cond_e

    .line 1622
    aget v2, p6, v0

    add-int/2addr v2, v1

    invoke-static {p0, p1, v2, p3, p4}, Lorg/spongycastle/math/ec/LongArray;->flipWord([JIIJ)V

    goto :goto_3

    .line 1624
    :cond_e
    invoke-static {p0, p1, v1, p3, p4}, Lorg/spongycastle/math/ec/LongArray;->flipWord([JIIJ)V

    .line 1625
    return-void
.end method

.method private static reduceWordWise([JIIII[I)V
    .registers 15
    .param p0, "buf"    # [J
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "toBit"    # I
    .param p4, "m"    # I
    .param p5, "ks"    # [I

    .prologue
    .line 1593
    ushr-int/lit8 v8, p3, 0x6

    .line 1595
    .local v8, "toPos":I
    :cond_2
    :goto_2
    add-int/lit8 p2, p2, -0x1

    if-le p2, v8, :cond_20

    .line 1597
    add-int v0, p1, p2

    aget-wide v3, p0, v0

    .line 1598
    .local v3, "word":J
    const-wide/16 v0, 0x0

    cmp-long v0, v3, v0

    if-eqz v0, :cond_2

    .line 1600
    add-int v0, p1, p2

    const-wide/16 v1, 0x0

    aput-wide v1, p0, v0

    .line 1601
    shl-int/lit8 v2, p2, 0x6

    move-object v0, p0

    move v1, p1

    move v5, p4

    move-object v6, p5

    invoke-static/range {v0 .. v6}, Lorg/spongycastle/math/ec/LongArray;->reduceWord([JIIJI[I)V

    goto :goto_2

    .line 1606
    .end local v3    # "word":J
    :cond_20
    and-int/lit8 v7, p3, 0x3f

    .line 1607
    .local v7, "partial":I
    add-int v0, p1, v8

    aget-wide v0, p0, v0

    ushr-long v3, v0, v7

    .line 1608
    .restart local v3    # "word":J
    const-wide/16 v0, 0x0

    cmp-long v0, v3, v0

    if-eqz v0, :cond_3f

    .line 1610
    add-int v0, p1, v8

    aget-wide v1, p0, v0

    shl-long v5, v3, v7

    xor-long/2addr v1, v5

    aput-wide v1, p0, v0

    move-object v0, p0

    move v1, p1

    move v2, p3

    move v5, p4

    move-object v6, p5

    .line 1611
    invoke-static/range {v0 .. v6}, Lorg/spongycastle/math/ec/LongArray;->reduceWord([JIIJI[I)V

    .line 1614
    :cond_3f
    return-void
.end method

.method private resizedInts(I)[J
    .registers 6
    .param p1, "newLen"    # I

    .prologue
    const/4 v3, 0x0

    .line 530
    new-array v0, p1, [J

    .line 531
    .local v0, "newInts":[J
    iget-object v1, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    iget-object v2, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    array-length v2, v2

    invoke-static {v2, p1}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 532
    return-object v0
.end method

.method private static shiftUp([JIII)J
    .registers 13
    .param p0, "x"    # [J
    .param p1, "xOff"    # I
    .param p2, "count"    # I
    .param p3, "shift"    # I

    .prologue
    .line 590
    rsub-int/lit8 v5, p3, 0x40

    .line 591
    .local v5, "shiftInv":I
    const-wide/16 v3, 0x0

    .line 592
    .local v3, "prev":J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    if-ge v0, p2, :cond_17

    .line 594
    add-int v6, p1, v0

    aget-wide v1, p0, v6

    .line 595
    .local v1, "next":J
    add-int v6, p1, v0

    shl-long v7, v1, p3

    or-long/2addr v7, v3

    aput-wide v7, p0, v6

    .line 596
    ushr-long v3, v1, v5

    .line 592
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 598
    .end local v1    # "next":J
    :cond_17
    return-wide v3
.end method

.method private static shiftUp([JI[JIII)J
    .registers 15
    .param p0, "x"    # [J
    .param p1, "xOff"    # I
    .param p2, "z"    # [J
    .param p3, "zOff"    # I
    .param p4, "count"    # I
    .param p5, "shift"    # I

    .prologue
    .line 603
    rsub-int/lit8 v5, p5, 0x40

    .line 604
    .local v5, "shiftInv":I
    const-wide/16 v3, 0x0

    .line 605
    .local v3, "prev":J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    if-ge v0, p4, :cond_17

    .line 607
    add-int v6, p1, v0

    aget-wide v1, p0, v6

    .line 608
    .local v1, "next":J
    add-int v6, p3, v0

    shl-long v7, v1, p5

    or-long/2addr v7, v3

    aput-wide v7, p2, v6

    .line 609
    ushr-long v3, v1, v5

    .line 605
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 611
    .end local v1    # "next":J
    :cond_17
    return-wide v3
.end method

.method private static squareInPlace([JII[I)V
    .registers 9
    .param p0, "x"    # [J
    .param p1, "xLen"    # I
    .param p2, "m"    # I
    .param p3, "ks"    # [I

    .prologue
    .line 1726
    shl-int/lit8 v0, p1, 0x1

    .line 1727
    .local v0, "pos":I
    :goto_2
    add-int/lit8 p1, p1, -0x1

    if-ltz p1, :cond_1f

    .line 1729
    aget-wide v1, p0, p1

    .line 1730
    .local v1, "xVal":J
    add-int/lit8 v0, v0, -0x1

    const/16 v3, 0x20

    ushr-long v3, v1, v3

    long-to-int v3, v3

    invoke-static {v3}, Lorg/spongycastle/math/ec/LongArray;->interleave2_32to64(I)J

    move-result-wide v3

    aput-wide v3, p0, v0

    .line 1731
    add-int/lit8 v0, v0, -0x1

    long-to-int v3, v1

    invoke-static {v3}, Lorg/spongycastle/math/ec/LongArray;->interleave2_32to64(I)J

    move-result-wide v3

    aput-wide v3, p0, v0

    goto :goto_2

    .line 1733
    .end local v1    # "xVal":J
    :cond_1f
    return-void
.end method

.method private static testBit([JII)Z
    .registers 11
    .param p0, "buf"    # [J
    .param p1, "off"    # I
    .param p2, "n"    # I

    .prologue
    .line 800
    ushr-int/lit8 v3, p2, 0x6

    .line 802
    .local v3, "theInt":I
    and-int/lit8 v2, p2, 0x3f

    .line 803
    .local v2, "theBit":I
    const-wide/16 v4, 0x1

    shl-long v0, v4, v2

    .line 804
    .local v0, "tester":J
    add-int v4, p1, v3

    aget-wide v4, p0, v4

    and-long/2addr v4, v0

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-eqz v4, :cond_15

    const/4 v4, 0x1

    :goto_14
    return v4

    :cond_15
    const/4 v4, 0x0

    goto :goto_14
.end method


# virtual methods
.method public addOne()Lorg/spongycastle/math/ec/LongArray;
    .registers 8

    .prologue
    const-wide/16 v5, 0x1

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 616
    iget-object v2, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    array-length v2, v2

    if-nez v2, :cond_13

    .line 618
    new-instance v2, Lorg/spongycastle/math/ec/LongArray;

    new-array v3, v3, [J

    aput-wide v5, v3, v4

    invoke-direct {v2, v3}, Lorg/spongycastle/math/ec/LongArray;-><init>([J)V

    .line 624
    :goto_12
    return-object v2

    .line 621
    :cond_13
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/LongArray;->getUsedLength()I

    move-result v2

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 622
    .local v1, "resultLen":I
    invoke-direct {p0, v1}, Lorg/spongycastle/math/ec/LongArray;->resizedInts(I)[J

    move-result-object v0

    .line 623
    .local v0, "ints":[J
    aget-wide v2, v0, v4

    xor-long/2addr v2, v5

    aput-wide v2, v0, v4

    .line 624
    new-instance v2, Lorg/spongycastle/math/ec/LongArray;

    invoke-direct {v2, v0}, Lorg/spongycastle/math/ec/LongArray;-><init>([J)V

    goto :goto_12
.end method

.method public addShiftedByWords(Lorg/spongycastle/math/ec/LongArray;I)V
    .registers 8
    .param p1, "other"    # Lorg/spongycastle/math/ec/LongArray;
    .param p2, "words"    # I

    .prologue
    .line 703
    invoke-virtual {p1}, Lorg/spongycastle/math/ec/LongArray;->getUsedLength()I

    move-result v1

    .line 704
    .local v1, "otherUsedLen":I
    if-nez v1, :cond_7

    .line 716
    :goto_6
    return-void

    .line 709
    :cond_7
    add-int v0, v1, p2

    .line 710
    .local v0, "minLen":I
    iget-object v2, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    array-length v2, v2

    if-le v0, v2, :cond_14

    .line 712
    invoke-direct {p0, v0}, Lorg/spongycastle/math/ec/LongArray;->resizedInts(I)[J

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    .line 715
    :cond_14
    iget-object v2, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    iget-object v3, p1, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    const/4 v4, 0x0

    invoke-static {v2, p2, v3, v4, v1}, Lorg/spongycastle/math/ec/LongArray;->add([JI[JII)V

    goto :goto_6
.end method

.method public clone()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 2170
    new-instance v0, Lorg/spongycastle/math/ec/LongArray;

    iget-object v1, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    invoke-static {v1}, Lorg/spongycastle/util/Arrays;->clone([J)[J

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/math/ec/LongArray;-><init>([J)V

    return-object v0
.end method

.method public degree()I
    .registers 6

    .prologue
    .line 444
    iget-object v3, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    array-length v0, v3

    .line 448
    .local v0, "i":I
    :cond_3
    if-nez v0, :cond_7

    .line 450
    const/4 v3, 0x0

    .line 456
    :goto_6
    return v3

    .line 452
    :cond_7
    iget-object v3, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    add-int/lit8 v0, v0, -0x1

    aget-wide v1, v3, v0

    .line 454
    .local v1, "w":J
    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-eqz v3, :cond_3

    .line 456
    shl-int/lit8 v3, v0, 0x6

    invoke-static {v1, v2}, Lorg/spongycastle/math/ec/LongArray;->bitLength(J)I

    move-result v4

    add-int/2addr v3, v4

    goto :goto_6
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 10
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    .line 2133
    instance-of v4, p1, Lorg/spongycastle/math/ec/LongArray;

    if-nez v4, :cond_6

    .line 2150
    :cond_5
    :goto_5
    return v3

    :cond_6
    move-object v1, p1

    .line 2137
    check-cast v1, Lorg/spongycastle/math/ec/LongArray;

    .line 2138
    .local v1, "other":Lorg/spongycastle/math/ec/LongArray;
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/LongArray;->getUsedLength()I

    move-result v2

    .line 2139
    .local v2, "usedLen":I
    invoke-virtual {v1}, Lorg/spongycastle/math/ec/LongArray;->getUsedLength()I

    move-result v4

    if-ne v4, v2, :cond_5

    .line 2143
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_14
    if-ge v0, v2, :cond_25

    .line 2145
    iget-object v4, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    aget-wide v4, v4, v0

    iget-object v6, v1, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    aget-wide v6, v6, v0

    cmp-long v4, v4, v6

    if-nez v4, :cond_5

    .line 2143
    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    .line 2150
    :cond_25
    const/4 v3, 0x1

    goto :goto_5
.end method

.method public getLength()I
    .registers 2

    .prologue
    .line 754
    iget-object v0, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    array-length v0, v0

    return v0
.end method

.method public getUsedLength()I
    .registers 2

    .prologue
    .line 408
    iget-object v0, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    array-length v0, v0

    invoke-virtual {p0, v0}, Lorg/spongycastle/math/ec/LongArray;->getUsedLengthFrom(I)I

    move-result v0

    return v0
.end method

.method public getUsedLengthFrom(I)I
    .registers 8
    .param p1, "from"    # I

    .prologue
    const-wide/16 v4, 0x0

    const/4 v1, 0x0

    .line 413
    iget-object v0, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    .line 414
    .local v0, "a":[J
    array-length v2, v0

    invoke-static {p1, v2}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 416
    const/4 v2, 0x1

    if-ge p1, v2, :cond_e

    .line 439
    :goto_d
    return v1

    .line 422
    :cond_e
    aget-wide v2, v0, v1

    cmp-long v2, v2, v4

    if-eqz v2, :cond_1f

    .line 424
    :cond_14
    add-int/lit8 p1, p1, -0x1

    aget-wide v1, v0, p1

    cmp-long v1, v1, v4

    if-eqz v1, :cond_14

    .line 427
    add-int/lit8 v1, p1, 0x1

    goto :goto_d

    .line 432
    :cond_1f
    add-int/lit8 p1, p1, -0x1

    aget-wide v2, v0, p1

    cmp-long v2, v2, v4

    if-eqz v2, :cond_2a

    .line 434
    add-int/lit8 v1, p1, 0x1

    goto :goto_d

    .line 437
    :cond_2a
    if-gtz p1, :cond_1f

    goto :goto_d
.end method

.method public hashCode()I
    .registers 8

    .prologue
    .line 2155
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/LongArray;->getUsedLength()I

    move-result v4

    .line 2156
    .local v4, "usedLen":I
    const/4 v0, 0x1

    .line 2157
    .local v0, "hash":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    if-ge v1, v4, :cond_1b

    .line 2159
    iget-object v5, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    aget-wide v2, v5, v1

    .line 2160
    .local v2, "mi":J
    mul-int/lit8 v0, v0, 0x1f

    .line 2161
    long-to-int v5, v2

    xor-int/2addr v0, v5

    .line 2162
    mul-int/lit8 v0, v0, 0x1f

    .line 2163
    const/16 v5, 0x20

    ushr-long v5, v2, v5

    long-to-int v5, v5

    xor-int/2addr v0, v5

    .line 2157
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 2165
    .end local v2    # "mi":J
    :cond_1b
    return v0
.end method

.method public isOne()Z
    .registers 8

    .prologue
    const/4 v2, 0x0

    .line 378
    iget-object v0, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    .line 379
    .local v0, "a":[J
    aget-wide v3, v0, v2

    const-wide/16 v5, 0x1

    cmp-long v3, v3, v5

    if-eqz v3, :cond_c

    .line 390
    :cond_b
    :goto_b
    return v2

    .line 383
    :cond_c
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_d
    array-length v3, v0

    if-ge v1, v3, :cond_1b

    .line 385
    aget-wide v3, v0, v1

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-nez v3, :cond_b

    .line 383
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 390
    :cond_1b
    const/4 v2, 0x1

    goto :goto_b
.end method

.method public isZero()Z
    .registers 7

    .prologue
    .line 395
    iget-object v0, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    .line 396
    .local v0, "a":[J
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3
    array-length v2, v0

    if-ge v1, v2, :cond_13

    .line 398
    aget-wide v2, v0, v1

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_10

    .line 400
    const/4 v2, 0x0

    .line 403
    :goto_f
    return v2

    .line 396
    :cond_10
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 403
    :cond_13
    const/4 v2, 0x1

    goto :goto_f
.end method

.method public modInverse(I[I)Lorg/spongycastle/math/ec/LongArray;
    .registers 28
    .param p1, "m"    # I
    .param p2, "ks"    # [I

    .prologue
    .line 2056
    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/math/ec/LongArray;->degree()I

    move-result v19

    .line 2057
    .local v19, "uzDegree":I
    if-nez v19, :cond_c

    .line 2059
    new-instance v21, Ljava/lang/IllegalStateException;

    invoke-direct/range {v21 .. v21}, Ljava/lang/IllegalStateException;-><init>()V

    throw v21

    .line 2061
    :cond_c
    const/16 v21, 0x1

    move/from16 v0, v19

    move/from16 v1, v21

    if-ne v0, v1, :cond_15

    .line 2108
    .end local p0    # "this":Lorg/spongycastle/math/ec/LongArray;
    :goto_14
    return-object p0

    .line 2067
    .restart local p0    # "this":Lorg/spongycastle/math/ec/LongArray;
    :cond_15
    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/math/ec/LongArray;->clone()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lorg/spongycastle/math/ec/LongArray;

    .line 2069
    .local v18, "uz":Lorg/spongycastle/math/ec/LongArray;
    add-int/lit8 v21, p1, 0x3f

    ushr-int/lit8 v15, v21, 0x6

    .line 2072
    .local v15, "t":I
    new-instance v20, Lorg/spongycastle/math/ec/LongArray;

    move-object/from16 v0, v20

    invoke-direct {v0, v15}, Lorg/spongycastle/math/ec/LongArray;-><init>(I)V

    .line 2073
    .local v20, "vz":Lorg/spongycastle/math/ec/LongArray;
    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    move-object/from16 v21, v0

    const/16 v22, 0x0

    move-object/from16 v0, v21

    move/from16 v1, v22

    move/from16 v2, p1

    move/from16 v3, p1

    move-object/from16 v4, p2

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/math/ec/LongArray;->reduceBit([JIII[I)V

    .line 2076
    new-instance v10, Lorg/spongycastle/math/ec/LongArray;

    invoke-direct {v10, v15}, Lorg/spongycastle/math/ec/LongArray;-><init>(I)V

    .line 2077
    .local v10, "g1z":Lorg/spongycastle/math/ec/LongArray;
    iget-object v0, v10, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    move-object/from16 v21, v0

    const/16 v22, 0x0

    const-wide/16 v23, 0x1

    aput-wide v23, v21, v22

    .line 2078
    new-instance v11, Lorg/spongycastle/math/ec/LongArray;

    invoke-direct {v11, v15}, Lorg/spongycastle/math/ec/LongArray;-><init>(I)V

    .line 2080
    .local v11, "g2z":Lorg/spongycastle/math/ec/LongArray;
    const/16 v21, 0x2

    move/from16 v0, v21

    new-array v0, v0, [I

    move-object/from16 v17, v0

    const/16 v21, 0x0

    aput v19, v17, v21

    const/16 v21, 0x1

    add-int/lit8 v22, p1, 0x1

    aput v22, v17, v21

    .line 2081
    .local v17, "uvDeg":[I
    const/16 v21, 0x2

    move/from16 v0, v21

    new-array v0, v0, [Lorg/spongycastle/math/ec/LongArray;

    move-object/from16 v16, v0

    const/16 v21, 0x0

    aput-object v18, v16, v21

    const/16 v21, 0x1

    aput-object v20, v16, v21

    .line 2083
    .local v16, "uv":[Lorg/spongycastle/math/ec/LongArray;
    const/16 v21, 0x2

    move/from16 v0, v21

    new-array v13, v0, [I

    fill-array-data v13, :array_ea

    .line 2084
    .local v13, "ggDeg":[I
    const/16 v21, 0x2

    move/from16 v0, v21

    new-array v12, v0, [Lorg/spongycastle/math/ec/LongArray;

    const/16 v21, 0x0

    aput-object v10, v12, v21

    const/16 v21, 0x1

    aput-object v11, v12, v21

    .line 2086
    .local v12, "gg":[Lorg/spongycastle/math/ec/LongArray;
    const/4 v5, 0x1

    .line 2087
    .local v5, "b":I
    aget v8, v17, v5

    .line 2088
    .local v8, "duv1":I
    aget v6, v13, v5

    .line 2089
    .local v6, "dgg1":I
    const/16 v21, 0x0

    aget v21, v17, v21

    sub-int v14, v8, v21

    .line 2093
    .local v14, "j":I
    :goto_93
    if-gez v14, :cond_a0

    .line 2095
    neg-int v14, v14

    .line 2096
    aput v8, v17, v5

    .line 2097
    aput v6, v13, v5

    .line 2098
    rsub-int/lit8 v5, v5, 0x1

    .line 2099
    aget v8, v17, v5

    .line 2100
    aget v6, v13, v5

    .line 2103
    :cond_a0
    aget-object v21, v16, v5

    rsub-int/lit8 v22, v5, 0x1

    aget-object v22, v16, v22

    rsub-int/lit8 v23, v5, 0x1

    aget v23, v17, v23

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v0, v1, v2, v14}, Lorg/spongycastle/math/ec/LongArray;->addShiftedByBitsSafe(Lorg/spongycastle/math/ec/LongArray;II)V

    .line 2105
    aget-object v21, v16, v5

    move-object/from16 v0, v21

    invoke-direct {v0, v8}, Lorg/spongycastle/math/ec/LongArray;->degreeFrom(I)I

    move-result v9

    .line 2106
    .local v9, "duv2":I
    if-nez v9, :cond_c3

    .line 2108
    rsub-int/lit8 v21, v5, 0x1

    aget-object p0, v12, v21

    goto/16 :goto_14

    .line 2112
    :cond_c3
    rsub-int/lit8 v21, v5, 0x1

    aget v7, v13, v21

    .line 2113
    .local v7, "dgg2":I
    aget-object v21, v12, v5

    rsub-int/lit8 v22, v5, 0x1

    aget-object v22, v12, v22

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-direct {v0, v1, v7, v14}, Lorg/spongycastle/math/ec/LongArray;->addShiftedByBitsSafe(Lorg/spongycastle/math/ec/LongArray;II)V

    .line 2114
    add-int/2addr v7, v14

    .line 2116
    if-le v7, v6, :cond_de

    .line 2118
    move v6, v7

    .line 2126
    :cond_d8
    :goto_d8
    sub-int v21, v9, v8

    add-int v14, v14, v21

    .line 2127
    move v8, v9

    .line 2128
    goto :goto_93

    .line 2120
    :cond_de
    if-ne v7, v6, :cond_d8

    .line 2122
    aget-object v21, v12, v5

    move-object/from16 v0, v21

    invoke-direct {v0, v6}, Lorg/spongycastle/math/ec/LongArray;->degreeFrom(I)I

    move-result v6

    goto :goto_d8

    .line 2083
    nop

    :array_ea
    .array-data 4
        0x1
        0x0
    .end array-data
.end method

.method public modMultiply(Lorg/spongycastle/math/ec/LongArray;I[I)Lorg/spongycastle/math/ec/LongArray;
    .registers 45
    .param p1, "other"    # Lorg/spongycastle/math/ec/LongArray;
    .param p2, "m"    # I
    .param p3, "ks"    # [I

    .prologue
    .line 995
    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/math/ec/LongArray;->degree()I

    move-result v29

    .line 996
    .local v29, "aDeg":I
    if-nez v29, :cond_7

    .line 1119
    .end local p0    # "this":Lorg/spongycastle/math/ec/LongArray;
    :goto_6
    return-object p0

    .line 1000
    .restart local p0    # "this":Lorg/spongycastle/math/ec/LongArray;
    :cond_7
    invoke-virtual/range {p1 .. p1}, Lorg/spongycastle/math/ec/LongArray;->degree()I

    move-result v34

    .line 1001
    .local v34, "bDeg":I
    if-nez v34, :cond_10

    move-object/from16 p0, p1

    .line 1003
    goto :goto_6

    .line 1009
    :cond_10
    move-object/from16 v25, p0

    .local v25, "A":Lorg/spongycastle/math/ec/LongArray;
    move-object/from16 v26, p1

    .line 1010
    .local v26, "B":Lorg/spongycastle/math/ec/LongArray;
    move/from16 v0, v29

    move/from16 v1, v34

    if-le v0, v1, :cond_24

    .line 1012
    move-object/from16 v25, p1

    move-object/from16 v26, p0

    .line 1013
    move/from16 v38, v29

    .local v38, "tmp":I
    move/from16 v29, v34

    move/from16 v34, v38

    .line 1019
    .end local v38    # "tmp":I
    :cond_24
    add-int/lit8 v6, v29, 0x3f

    ushr-int/lit8 v30, v6, 0x6

    .line 1020
    .local v30, "aLen":I
    add-int/lit8 v6, v34, 0x3f

    ushr-int/lit8 v7, v6, 0x6

    .line 1021
    .local v7, "bLen":I
    add-int v6, v29, v34

    add-int/lit8 v6, v6, 0x3e

    ushr-int/lit8 v35, v6, 0x6

    .line 1023
    .local v35, "cLen":I
    const/4 v6, 0x1

    move/from16 v0, v30

    if-ne v0, v6, :cond_5f

    .line 1025
    move-object/from16 v0, v25

    iget-object v6, v0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    const/4 v10, 0x0

    aget-wide v4, v6, v10

    .line 1026
    .local v4, "a0":J
    const-wide/16 v10, 0x1

    cmp-long v6, v4, v10

    if-nez v6, :cond_47

    move-object/from16 p0, v26

    .line 1028
    goto :goto_6

    .line 1034
    :cond_47
    move/from16 v0, v35

    new-array v8, v0, [J

    .line 1035
    .local v8, "c0":[J
    move-object/from16 v0, v26

    iget-object v6, v0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    const/4 v9, 0x0

    invoke-static/range {v4 .. v9}, Lorg/spongycastle/math/ec/LongArray;->multiplyWord(J[JI[JI)V

    .line 1040
    const/4 v6, 0x0

    move/from16 v0, v35

    move/from16 v1, p2

    move-object/from16 v2, p3

    invoke-static {v8, v6, v0, v1, v2}, Lorg/spongycastle/math/ec/LongArray;->reduceResult([JIII[I)Lorg/spongycastle/math/ec/LongArray;

    move-result-object p0

    goto :goto_6

    .line 1046
    .end local v4    # "a0":J
    .end local v8    # "c0":[J
    :cond_5f
    add-int/lit8 v6, v34, 0x7

    add-int/lit8 v6, v6, 0x3f

    ushr-int/lit8 v13, v6, 0x6

    .line 1051
    .local v13, "bMax":I
    const/16 v6, 0x10

    new-array v0, v6, [I

    move-object/from16 v37, v0

    .line 1056
    .local v37, "ti":[I
    shl-int/lit8 v6, v13, 0x4

    new-array v9, v6, [J

    .line 1057
    .local v9, "T0":[J
    move v12, v13

    .line 1058
    .local v12, "tOff":I
    const/4 v6, 0x1

    aput v12, v37, v6

    .line 1059
    move-object/from16 v0, v26

    iget-object v6, v0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    const/4 v10, 0x0

    invoke-static {v6, v10, v9, v12, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1060
    const/16 v36, 0x2

    .local v36, "i":I
    :goto_7d
    const/16 v6, 0x10

    move/from16 v0, v36

    if-ge v0, v6, :cond_a4

    .line 1062
    add-int/2addr v12, v13

    aput v12, v37, v36

    .line 1063
    and-int/lit8 v6, v36, 0x1

    if-nez v6, :cond_94

    .line 1065
    ushr-int/lit8 v10, v12, 0x1

    const/4 v14, 0x1

    move-object v11, v9

    invoke-static/range {v9 .. v14}, Lorg/spongycastle/math/ec/LongArray;->shiftUp([JI[JIII)J

    .line 1060
    :goto_91
    add-int/lit8 v36, v36, 0x1

    goto :goto_7d

    .line 1069
    :cond_94
    sub-int v17, v12, v13

    move-object v14, v9

    move v15, v13

    move-object/from16 v16, v9

    move-object/from16 v18, v9

    move/from16 v19, v12

    move/from16 v20, v13

    invoke-static/range {v14 .. v20}, Lorg/spongycastle/math/ec/LongArray;->add([JI[JI[JII)V

    goto :goto_91

    .line 1076
    :cond_a4
    array-length v6, v9

    new-array v0, v6, [J

    move-object/from16 v16, v0

    .line 1077
    .local v16, "T1":[J
    const/4 v15, 0x0

    const/16 v17, 0x0

    array-length v0, v9

    move/from16 v18, v0

    const/16 v19, 0x4

    move-object v14, v9

    invoke-static/range {v14 .. v19}, Lorg/spongycastle/math/ec/LongArray;->shiftUp([JI[JIII)J

    .line 1080
    move-object/from16 v0, v25

    iget-object v0, v0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    move-object/from16 v28, v0

    .line 1081
    .local v28, "a":[J
    shl-int/lit8 v6, v35, 0x3

    new-array v0, v6, [J

    move-object/from16 v17, v0

    .line 1083
    .local v17, "c":[J
    const/16 v27, 0xf

    .line 1089
    .local v27, "MASK":I
    const/16 v31, 0x0

    .local v31, "aPos":I
    :goto_c5
    move/from16 v0, v31

    move/from16 v1, v30

    if-ge v0, v1, :cond_f8

    .line 1091
    aget-wide v32, v28, v31

    .line 1092
    .local v32, "aVal":J
    move/from16 v18, v31

    .line 1095
    .local v18, "cOff":I
    :goto_cf
    move-wide/from16 v0, v32

    long-to-int v6, v0

    and-int v39, v6, v27

    .line 1096
    .local v39, "u":I
    const/4 v6, 0x4

    ushr-long v32, v32, v6

    .line 1097
    move-wide/from16 v0, v32

    long-to-int v6, v0

    and-int v40, v6, v27

    .line 1098
    .local v40, "v":I
    aget v20, v37, v39

    aget v22, v37, v40

    move-object/from16 v19, v9

    move-object/from16 v21, v16

    move/from16 v23, v13

    invoke-static/range {v17 .. v23}, Lorg/spongycastle/math/ec/LongArray;->addBoth([JI[JI[JII)V

    .line 1099
    const/4 v6, 0x4

    ushr-long v32, v32, v6

    .line 1100
    const-wide/16 v10, 0x0

    cmp-long v6, v32, v10

    if-nez v6, :cond_f5

    .line 1089
    add-int/lit8 v31, v31, 0x1

    goto :goto_c5

    .line 1104
    :cond_f5
    add-int v18, v18, v35

    .line 1105
    goto :goto_cf

    .line 1109
    .end local v18    # "cOff":I
    .end local v32    # "aVal":J
    .end local v39    # "u":I
    .end local v40    # "v":I
    :cond_f8
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v18, v0

    .line 1110
    .restart local v18    # "cOff":I
    :goto_fd
    sub-int v18, v18, v35

    if-eqz v18, :cond_111

    .line 1112
    sub-int v20, v18, v35

    const/16 v24, 0x8

    move-object/from16 v19, v17

    move-object/from16 v21, v17

    move/from16 v22, v18

    move/from16 v23, v35

    invoke-static/range {v19 .. v24}, Lorg/spongycastle/math/ec/LongArray;->addShiftedUp([JI[JIII)J

    goto :goto_fd

    .line 1119
    :cond_111
    const/4 v6, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v35

    move/from16 v2, p2

    move-object/from16 v3, p3

    invoke-static {v0, v6, v1, v2, v3}, Lorg/spongycastle/math/ec/LongArray;->reduceResult([JIII[I)Lorg/spongycastle/math/ec/LongArray;

    move-result-object p0

    goto/16 :goto_6
.end method

.method public modMultiplyAlt(Lorg/spongycastle/math/ec/LongArray;I[I)Lorg/spongycastle/math/ec/LongArray;
    .registers 50
    .param p1, "other"    # Lorg/spongycastle/math/ec/LongArray;
    .param p2, "m"    # I
    .param p3, "ks"    # [I

    .prologue
    .line 1127
    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/math/ec/LongArray;->degree()I

    move-result v29

    .line 1128
    .local v29, "aDeg":I
    if-nez v29, :cond_7

    .line 1336
    .end local p0    # "this":Lorg/spongycastle/math/ec/LongArray;
    :goto_6
    return-object p0

    .line 1132
    .restart local p0    # "this":Lorg/spongycastle/math/ec/LongArray;
    :cond_7
    invoke-virtual/range {p1 .. p1}, Lorg/spongycastle/math/ec/LongArray;->degree()I

    move-result v33

    .line 1133
    .local v33, "bDeg":I
    if-nez v33, :cond_10

    move-object/from16 p0, p1

    .line 1135
    goto :goto_6

    .line 1141
    :cond_10
    move-object/from16 v26, p0

    .local v26, "A":Lorg/spongycastle/math/ec/LongArray;
    move-object/from16 v27, p1

    .line 1142
    .local v27, "B":Lorg/spongycastle/math/ec/LongArray;
    move/from16 v0, v29

    move/from16 v1, v33

    if-le v0, v1, :cond_24

    .line 1144
    move-object/from16 v26, p1

    move-object/from16 v27, p0

    .line 1145
    move/from16 v44, v29

    .local v44, "tmp":I
    move/from16 v29, v33

    move/from16 v33, v44

    .line 1151
    .end local v44    # "tmp":I
    :cond_24
    add-int/lit8 v5, v29, 0x3f

    ushr-int/lit8 v12, v5, 0x6

    .line 1152
    .local v12, "aLen":I
    add-int/lit8 v5, v33, 0x3f

    ushr-int/lit8 v6, v5, 0x6

    .line 1153
    .local v6, "bLen":I
    add-int v5, v29, v33

    add-int/lit8 v5, v5, 0x3e

    ushr-int/lit8 v24, v5, 0x6

    .line 1155
    .local v24, "cLen":I
    const/4 v5, 0x1

    if-ne v12, v5, :cond_5d

    .line 1157
    move-object/from16 v0, v26

    iget-object v5, v0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    const/4 v8, 0x0

    aget-wide v3, v5, v8

    .line 1158
    .local v3, "a0":J
    const-wide/16 v8, 0x1

    cmp-long v5, v3, v8

    if-nez v5, :cond_45

    move-object/from16 p0, v27

    .line 1160
    goto :goto_6

    .line 1166
    :cond_45
    move/from16 v0, v24

    new-array v7, v0, [J

    .line 1167
    .local v7, "c0":[J
    move-object/from16 v0, v27

    iget-object v5, v0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    const/4 v8, 0x0

    invoke-static/range {v3 .. v8}, Lorg/spongycastle/math/ec/LongArray;->multiplyWord(J[JI[JI)V

    .line 1172
    const/4 v5, 0x0

    move/from16 v0, v24

    move/from16 v1, p2

    move-object/from16 v2, p3

    invoke-static {v7, v5, v0, v1, v2}, Lorg/spongycastle/math/ec/LongArray;->reduceResult([JIII[I)Lorg/spongycastle/math/ec/LongArray;

    move-result-object p0

    goto :goto_6

    .line 1208
    .end local v3    # "a0":J
    .end local v7    # "c0":[J
    :cond_5d
    const/4 v13, 0x4

    .local v13, "width":I
    const/16 v25, 0x10

    .local v25, "positions":I
    const/16 v45, 0x40

    .local v45, "top":I
    const/16 v35, 0x8

    .line 1216
    .local v35, "banks":I
    const/16 v5, 0x40

    move/from16 v0, v45

    if-ge v0, v5, :cond_96

    move/from16 v42, v25

    .line 1217
    .local v42, "shifts":I
    :goto_6c
    add-int v5, v33, v42

    add-int/lit8 v5, v5, 0x3f

    ushr-int/lit8 v18, v5, 0x6

    .line 1219
    .local v18, "bMax":I
    mul-int v34, v18, v35

    .local v34, "bTotal":I
    mul-int v43, v13, v35

    .line 1224
    .local v43, "stride":I
    const/16 v5, 0x10

    new-array v0, v5, [I

    move-object/from16 v37, v0

    .line 1225
    .local v37, "ci":[I
    move/from16 v36, v12

    .line 1227
    .local v36, "cTotal":I
    const/4 v5, 0x0

    aput v36, v37, v5

    .line 1228
    add-int v36, v36, v34

    .line 1229
    const/4 v5, 0x1

    aput v36, v37, v5

    .line 1230
    const/16 v39, 0x2

    .local v39, "i":I
    :goto_88
    move-object/from16 v0, v37

    array-length v5, v0

    move/from16 v0, v39

    if-ge v0, v5, :cond_99

    .line 1232
    add-int v36, v36, v24

    .line 1233
    aput v36, v37, v39

    .line 1230
    add-int/lit8 v39, v39, 0x1

    goto :goto_88

    .line 1216
    .end local v18    # "bMax":I
    .end local v34    # "bTotal":I
    .end local v36    # "cTotal":I
    .end local v37    # "ci":[I
    .end local v39    # "i":I
    .end local v42    # "shifts":I
    .end local v43    # "stride":I
    :cond_96
    const/16 v42, 0xf

    goto :goto_6c

    .line 1235
    .restart local v18    # "bMax":I
    .restart local v34    # "bTotal":I
    .restart local v36    # "cTotal":I
    .restart local v37    # "ci":[I
    .restart local v39    # "i":I
    .restart local v42    # "shifts":I
    .restart local v43    # "stride":I
    :cond_99
    add-int v36, v36, v24

    .line 1238
    add-int/lit8 v36, v36, 0x1

    .line 1240
    move/from16 v0, v36

    new-array v10, v0, [J

    .line 1243
    .local v10, "c":[J
    move-object/from16 v0, v26

    iget-object v8, v0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    const/4 v9, 0x0

    const/4 v11, 0x0

    invoke-static/range {v8 .. v13}, Lorg/spongycastle/math/ec/LongArray;->interleave([JI[JIII)V

    .line 1247
    move/from16 v17, v12

    .line 1248
    .local v17, "bOff":I
    move-object/from16 v0, v27

    iget-object v5, v0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    const/4 v8, 0x0

    move/from16 v0, v17

    invoke-static {v5, v8, v10, v0, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1249
    const/16 v19, 0x1

    .local v19, "bank":I
    :goto_b8
    move/from16 v0, v19

    move/from16 v1, v35

    if-ge v0, v1, :cond_ca

    .line 1251
    add-int v17, v17, v18

    move-object v14, v10

    move v15, v12

    move-object/from16 v16, v10

    invoke-static/range {v14 .. v19}, Lorg/spongycastle/math/ec/LongArray;->shiftUp([JI[JIII)J

    .line 1249
    add-int/lit8 v19, v19, 0x1

    goto :goto_b8

    .line 1261
    :cond_ca
    const/16 v5, 0x10

    add-int/lit8 v28, v5, -0x1

    .line 1263
    .local v28, "MASK":I
    const/16 v41, 0x0

    .line 1266
    .local v41, "k":I
    :goto_d0
    const/16 v30, 0x0

    .line 1269
    .local v30, "aPos":I
    :cond_d2
    aget-wide v8, v10, v30

    ushr-long v31, v8, v41

    .line 1270
    .local v31, "aVal":J
    const/16 v19, 0x0

    move/from16 v17, v12

    .line 1273
    :goto_da
    move-wide/from16 v0, v31

    long-to-int v5, v0

    and-int v40, v5, v28

    .line 1274
    .local v40, "index":I
    if-eqz v40, :cond_ec

    .line 1281
    aget v5, v37, v40

    add-int v5, v5, v30

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-static {v10, v5, v10, v0, v1}, Lorg/spongycastle/math/ec/LongArray;->add([JI[JII)V

    .line 1283
    :cond_ec
    add-int/lit8 v19, v19, 0x1

    move/from16 v0, v19

    move/from16 v1, v35

    if-ne v0, v1, :cond_12e

    .line 1291
    add-int/lit8 v30, v30, 0x1

    move/from16 v0, v30

    if-lt v0, v12, :cond_d2

    .line 1293
    add-int/lit8 v41, v41, 0x20

    move/from16 v0, v41

    move/from16 v1, v45

    if-lt v0, v1, :cond_139

    .line 1295
    const/16 v5, 0x40

    move/from16 v0, v41

    if-lt v0, v5, :cond_133

    .line 1314
    move-object/from16 v0, v37

    array-length v0, v0

    move/from16 v38, v0

    .line 1315
    .local v38, "ciPos":I
    :goto_10d
    add-int/lit8 v38, v38, -0x1

    const/4 v5, 0x1

    move/from16 v0, v38

    if-le v0, v5, :cond_150

    .line 1317
    move/from16 v0, v38

    int-to-long v8, v0

    const-wide/16 v14, 0x1

    and-long/2addr v8, v14

    const-wide/16 v14, 0x0

    cmp-long v5, v8, v14

    if-nez v5, :cond_141

    .line 1322
    ushr-int/lit8 v5, v38, 0x1

    aget v21, v37, v5

    aget v23, v37, v38

    move-object/from16 v20, v10

    move-object/from16 v22, v10

    invoke-static/range {v20 .. v25}, Lorg/spongycastle/math/ec/LongArray;->addShiftedUp([JI[JIII)J

    goto :goto_10d

    .line 1287
    .end local v38    # "ciPos":I
    :cond_12e
    add-int v17, v17, v18

    .line 1288
    ushr-long v31, v31, v13

    .line 1289
    goto :goto_da

    .line 1304
    :cond_133
    rsub-int/lit8 v41, v13, 0x40

    .line 1305
    shl-int/lit8 v5, v28, 0x4

    and-int v28, v28, v5

    .line 1311
    :cond_139
    move/from16 v0, v34

    move/from16 v1, v35

    invoke-static {v10, v12, v0, v1}, Lorg/spongycastle/math/ec/LongArray;->shiftUp([JIII)J

    goto :goto_d0

    .line 1329
    .restart local v38    # "ciPos":I
    :cond_141
    aget v5, v37, v38

    add-int/lit8 v8, v38, -0x1

    aget v8, v37, v8

    const/4 v9, 0x1

    aget v9, v37, v9

    move/from16 v0, v24

    invoke-static {v10, v5, v8, v9, v0}, Lorg/spongycastle/math/ec/LongArray;->distribute([JIIII)V

    goto :goto_10d

    .line 1336
    :cond_150
    const/4 v5, 0x1

    aget v5, v37, v5

    move/from16 v0, v24

    move/from16 v1, p2

    move-object/from16 v2, p3

    invoke-static {v10, v5, v0, v1, v2}, Lorg/spongycastle/math/ec/LongArray;->reduceResult([JIII[I)Lorg/spongycastle/math/ec/LongArray;

    move-result-object p0

    goto/16 :goto_6
.end method

.method public modMultiplyLD(Lorg/spongycastle/math/ec/LongArray;I[I)Lorg/spongycastle/math/ec/LongArray;
    .registers 44
    .param p1, "other"    # Lorg/spongycastle/math/ec/LongArray;
    .param p2, "m"    # I
    .param p3, "ks"    # [I

    .prologue
    .line 863
    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/math/ec/LongArray;->degree()I

    move-result v28

    .line 864
    .local v28, "aDeg":I
    if-nez v28, :cond_7

    .line 987
    .end local p0    # "this":Lorg/spongycastle/math/ec/LongArray;
    :goto_6
    return-object p0

    .line 868
    .restart local p0    # "this":Lorg/spongycastle/math/ec/LongArray;
    :cond_7
    invoke-virtual/range {p1 .. p1}, Lorg/spongycastle/math/ec/LongArray;->degree()I

    move-result v31

    .line 869
    .local v31, "bDeg":I
    if-nez v31, :cond_10

    move-object/from16 p0, p1

    .line 871
    goto :goto_6

    .line 877
    :cond_10
    move-object/from16 v24, p0

    .local v24, "A":Lorg/spongycastle/math/ec/LongArray;
    move-object/from16 v25, p1

    .line 878
    .local v25, "B":Lorg/spongycastle/math/ec/LongArray;
    move/from16 v0, v28

    move/from16 v1, v31

    if-le v0, v1, :cond_24

    .line 880
    move-object/from16 v24, p1

    move-object/from16 v25, p0

    .line 881
    move/from16 v37, v28

    .local v37, "tmp":I
    move/from16 v28, v31

    move/from16 v31, v37

    .line 887
    .end local v37    # "tmp":I
    :cond_24
    add-int/lit8 v6, v28, 0x3f

    ushr-int/lit8 v29, v6, 0x6

    .line 888
    .local v29, "aLen":I
    add-int/lit8 v6, v31, 0x3f

    ushr-int/lit8 v7, v6, 0x6

    .line 889
    .local v7, "bLen":I
    add-int v6, v28, v31

    add-int/lit8 v6, v6, 0x3e

    ushr-int/lit8 v32, v6, 0x6

    .line 891
    .local v32, "cLen":I
    const/4 v6, 0x1

    move/from16 v0, v29

    if-ne v0, v6, :cond_5f

    .line 893
    move-object/from16 v0, v24

    iget-object v6, v0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    const/4 v10, 0x0

    aget-wide v4, v6, v10

    .line 894
    .local v4, "a0":J
    const-wide/16 v10, 0x1

    cmp-long v6, v4, v10

    if-nez v6, :cond_47

    move-object/from16 p0, v25

    .line 896
    goto :goto_6

    .line 902
    :cond_47
    move/from16 v0, v32

    new-array v8, v0, [J

    .line 903
    .local v8, "c0":[J
    move-object/from16 v0, v25

    iget-object v6, v0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    const/4 v9, 0x0

    invoke-static/range {v4 .. v9}, Lorg/spongycastle/math/ec/LongArray;->multiplyWord(J[JI[JI)V

    .line 908
    const/4 v6, 0x0

    move/from16 v0, v32

    move/from16 v1, p2

    move-object/from16 v2, p3

    invoke-static {v8, v6, v0, v1, v2}, Lorg/spongycastle/math/ec/LongArray;->reduceResult([JIII[I)Lorg/spongycastle/math/ec/LongArray;

    move-result-object p0

    goto :goto_6

    .line 914
    .end local v4    # "a0":J
    .end local v8    # "c0":[J
    :cond_5f
    add-int/lit8 v6, v31, 0x7

    add-int/lit8 v6, v6, 0x3f

    ushr-int/lit8 v13, v6, 0x6

    .line 919
    .local v13, "bMax":I
    const/16 v6, 0x10

    new-array v0, v6, [I

    move-object/from16 v36, v0

    .line 924
    .local v36, "ti":[I
    shl-int/lit8 v6, v13, 0x4

    new-array v9, v6, [J

    .line 925
    .local v9, "T0":[J
    move v12, v13

    .line 926
    .local v12, "tOff":I
    const/4 v6, 0x1

    aput v12, v36, v6

    .line 927
    move-object/from16 v0, v25

    iget-object v6, v0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    const/4 v10, 0x0

    invoke-static {v6, v10, v9, v12, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 928
    const/16 v33, 0x2

    .local v33, "i":I
    :goto_7d
    const/16 v6, 0x10

    move/from16 v0, v33

    if-ge v0, v6, :cond_a4

    .line 930
    add-int/2addr v12, v13

    aput v12, v36, v33

    .line 931
    and-int/lit8 v6, v33, 0x1

    if-nez v6, :cond_94

    .line 933
    ushr-int/lit8 v10, v12, 0x1

    const/4 v14, 0x1

    move-object v11, v9

    invoke-static/range {v9 .. v14}, Lorg/spongycastle/math/ec/LongArray;->shiftUp([JI[JIII)J

    .line 928
    :goto_91
    add-int/lit8 v33, v33, 0x1

    goto :goto_7d

    .line 937
    :cond_94
    sub-int v17, v12, v13

    move-object v14, v9

    move v15, v13

    move-object/from16 v16, v9

    move-object/from16 v18, v9

    move/from16 v19, v12

    move/from16 v20, v13

    invoke-static/range {v14 .. v20}, Lorg/spongycastle/math/ec/LongArray;->add([JI[JI[JII)V

    goto :goto_91

    .line 944
    :cond_a4
    array-length v6, v9

    new-array v0, v6, [J

    move-object/from16 v16, v0

    .line 945
    .local v16, "T1":[J
    const/4 v15, 0x0

    const/16 v17, 0x0

    array-length v0, v9

    move/from16 v18, v0

    const/16 v19, 0x4

    move-object v14, v9

    invoke-static/range {v14 .. v19}, Lorg/spongycastle/math/ec/LongArray;->shiftUp([JI[JIII)J

    .line 948
    move-object/from16 v0, v24

    iget-object v0, v0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    move-object/from16 v27, v0

    .line 949
    .local v27, "a":[J
    move/from16 v0, v32

    new-array v0, v0, [J

    move-object/from16 v17, v0

    .line 951
    .local v17, "c":[J
    const/16 v26, 0xf

    .line 957
    .local v26, "MASK":I
    const/16 v35, 0x38

    .local v35, "k":I
    :goto_c5
    if-ltz v35, :cond_ff

    .line 959
    const/16 v18, 0x1

    .local v18, "j":I
    move/from16 v34, v18

    .end local v18    # "j":I
    .local v34, "j":I
    :goto_cb
    move/from16 v0, v34

    move/from16 v1, v29

    if-ge v0, v1, :cond_f2

    .line 961
    aget-wide v10, v27, v34

    ushr-long v10, v10, v35

    long-to-int v0, v10

    move/from16 v30, v0

    .line 962
    .local v30, "aVal":I
    and-int v38, v30, v26

    .line 963
    .local v38, "u":I
    ushr-int/lit8 v6, v30, 0x4

    and-int v39, v6, v26

    .line 964
    .local v39, "v":I
    add-int/lit8 v18, v34, -0x1

    aget v20, v36, v38

    aget v22, v36, v39

    move-object/from16 v19, v9

    move-object/from16 v21, v16

    move/from16 v23, v13

    invoke-static/range {v17 .. v23}, Lorg/spongycastle/math/ec/LongArray;->addBoth([JI[JI[JII)V

    .line 959
    add-int/lit8 v18, v34, 0x2

    .end local v34    # "j":I
    .restart local v18    # "j":I
    move/from16 v34, v18

    .end local v18    # "j":I
    .restart local v34    # "j":I
    goto :goto_cb

    .line 966
    .end local v30    # "aVal":I
    .end local v38    # "u":I
    .end local v39    # "v":I
    :cond_f2
    const/4 v6, 0x0

    const/16 v10, 0x8

    move-object/from16 v0, v17

    move/from16 v1, v32

    invoke-static {v0, v6, v1, v10}, Lorg/spongycastle/math/ec/LongArray;->shiftUp([JIII)J

    .line 957
    add-int/lit8 v35, v35, -0x8

    goto :goto_c5

    .line 969
    .end local v34    # "j":I
    :cond_ff
    const/16 v35, 0x38

    :goto_101
    if-ltz v35, :cond_137

    .line 971
    const/16 v18, 0x0

    .restart local v18    # "j":I
    :goto_105
    move/from16 v0, v18

    move/from16 v1, v29

    if-ge v0, v1, :cond_128

    .line 973
    aget-wide v10, v27, v18

    ushr-long v10, v10, v35

    long-to-int v0, v10

    move/from16 v30, v0

    .line 974
    .restart local v30    # "aVal":I
    and-int v38, v30, v26

    .line 975
    .restart local v38    # "u":I
    ushr-int/lit8 v6, v30, 0x4

    and-int v39, v6, v26

    .line 976
    .restart local v39    # "v":I
    aget v20, v36, v38

    aget v22, v36, v39

    move-object/from16 v19, v9

    move-object/from16 v21, v16

    move/from16 v23, v13

    invoke-static/range {v17 .. v23}, Lorg/spongycastle/math/ec/LongArray;->addBoth([JI[JI[JII)V

    .line 971
    add-int/lit8 v18, v18, 0x2

    goto :goto_105

    .line 978
    .end local v30    # "aVal":I
    .end local v38    # "u":I
    .end local v39    # "v":I
    :cond_128
    if-lez v35, :cond_134

    .line 980
    const/4 v6, 0x0

    const/16 v10, 0x8

    move-object/from16 v0, v17

    move/from16 v1, v32

    invoke-static {v0, v6, v1, v10}, Lorg/spongycastle/math/ec/LongArray;->shiftUp([JIII)J

    .line 969
    :cond_134
    add-int/lit8 v35, v35, -0x8

    goto :goto_101

    .line 987
    .end local v18    # "j":I
    :cond_137
    const/4 v6, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v32

    move/from16 v2, p2

    move-object/from16 v3, p3

    invoke-static {v0, v6, v1, v2, v3}, Lorg/spongycastle/math/ec/LongArray;->reduceResult([JIII[I)Lorg/spongycastle/math/ec/LongArray;

    move-result-object p0

    goto/16 :goto_6
.end method

.method public modReduce(I[I)Lorg/spongycastle/math/ec/LongArray;
    .registers 7
    .param p1, "m"    # I
    .param p2, "ks"    # [I

    .prologue
    const/4 v3, 0x0

    .line 1341
    iget-object v2, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    invoke-static {v2}, Lorg/spongycastle/util/Arrays;->clone([J)[J

    move-result-object v0

    .line 1342
    .local v0, "buf":[J
    array-length v2, v0

    invoke-static {v0, v3, v2, p1, p2}, Lorg/spongycastle/math/ec/LongArray;->reduceInPlace([JIII[I)I

    move-result v1

    .line 1343
    .local v1, "rLen":I
    new-instance v2, Lorg/spongycastle/math/ec/LongArray;

    invoke-direct {v2, v0, v3, v1}, Lorg/spongycastle/math/ec/LongArray;-><init>([JII)V

    return-object v2
.end method

.method public modSquare(I[I)Lorg/spongycastle/math/ec/LongArray;
    .registers 13
    .param p1, "m"    # I
    .param p2, "ks"    # [I

    .prologue
    const/4 v9, 0x0

    .line 1661
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/LongArray;->getUsedLength()I

    move-result v1

    .line 1662
    .local v1, "len":I
    if-nez v1, :cond_8

    .line 1678
    .end local p0    # "this":Lorg/spongycastle/math/ec/LongArray;
    :goto_7
    return-object p0

    .line 1667
    .restart local p0    # "this":Lorg/spongycastle/math/ec/LongArray;
    :cond_8
    shl-int/lit8 v0, v1, 0x1

    .line 1668
    .local v0, "_2len":I
    new-array v6, v0, [J

    .line 1670
    .local v6, "r":[J
    const/4 v4, 0x0

    .local v4, "pos":I
    move v5, v4

    .line 1671
    .end local v4    # "pos":I
    .local v5, "pos":I
    :goto_e
    if-ge v5, v0, :cond_2d

    .line 1673
    iget-object v7, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    ushr-int/lit8 v8, v5, 0x1

    aget-wide v2, v7, v8

    .line 1674
    .local v2, "mi":J
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "pos":I
    .restart local v4    # "pos":I
    long-to-int v7, v2

    invoke-static {v7}, Lorg/spongycastle/math/ec/LongArray;->interleave2_32to64(I)J

    move-result-wide v7

    aput-wide v7, v6, v5

    .line 1675
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "pos":I
    .restart local v5    # "pos":I
    const/16 v7, 0x20

    ushr-long v7, v2, v7

    long-to-int v7, v7

    invoke-static {v7}, Lorg/spongycastle/math/ec/LongArray;->interleave2_32to64(I)J

    move-result-wide v7

    aput-wide v7, v6, v4

    goto :goto_e

    .line 1678
    .end local v2    # "mi":J
    :cond_2d
    new-instance p0, Lorg/spongycastle/math/ec/LongArray;

    .end local p0    # "this":Lorg/spongycastle/math/ec/LongArray;
    array-length v7, v6

    invoke-static {v6, v9, v7, p1, p2}, Lorg/spongycastle/math/ec/LongArray;->reduceInPlace([JIII[I)I

    move-result v7

    invoke-direct {p0, v6, v9, v7}, Lorg/spongycastle/math/ec/LongArray;-><init>([JII)V

    goto :goto_7
.end method

.method public modSquareN(II[I)Lorg/spongycastle/math/ec/LongArray;
    .registers 9
    .param p1, "n"    # I
    .param p2, "m"    # I
    .param p3, "ks"    # [I

    .prologue
    const/4 v4, 0x0

    .line 1683
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/LongArray;->getUsedLength()I

    move-result v0

    .line 1684
    .local v0, "len":I
    if-nez v0, :cond_8

    .line 1699
    .end local p0    # "this":Lorg/spongycastle/math/ec/LongArray;
    :goto_7
    return-object p0

    .line 1689
    .restart local p0    # "this":Lorg/spongycastle/math/ec/LongArray;
    :cond_8
    add-int/lit8 v3, p2, 0x3f

    ushr-int/lit8 v1, v3, 0x6

    .line 1690
    .local v1, "mLen":I
    shl-int/lit8 v3, v1, 0x1

    new-array v2, v3, [J

    .line 1691
    .local v2, "r":[J
    iget-object v3, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    invoke-static {v3, v4, v2, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1693
    :goto_15
    add-int/lit8 p1, p1, -0x1

    if-ltz p1, :cond_22

    .line 1695
    invoke-static {v2, v0, p2, p3}, Lorg/spongycastle/math/ec/LongArray;->squareInPlace([JII[I)V

    .line 1696
    array-length v3, v2

    invoke-static {v2, v4, v3, p2, p3}, Lorg/spongycastle/math/ec/LongArray;->reduceInPlace([JIII[I)I

    move-result v0

    goto :goto_15

    .line 1699
    :cond_22
    new-instance p0, Lorg/spongycastle/math/ec/LongArray;

    .end local p0    # "this":Lorg/spongycastle/math/ec/LongArray;
    invoke-direct {p0, v2, v4, v0}, Lorg/spongycastle/math/ec/LongArray;-><init>([JII)V

    goto :goto_7
.end method

.method public multiply(Lorg/spongycastle/math/ec/LongArray;I[I)Lorg/spongycastle/math/ec/LongArray;
    .registers 43
    .param p1, "other"    # Lorg/spongycastle/math/ec/LongArray;
    .param p2, "m"    # I
    .param p3, "ks"    # [I

    .prologue
    .line 1351
    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/math/ec/LongArray;->degree()I

    move-result v27

    .line 1352
    .local v27, "aDeg":I
    if-nez v27, :cond_7

    .line 1477
    .end local p0    # "this":Lorg/spongycastle/math/ec/LongArray;
    :goto_6
    return-object p0

    .line 1356
    .restart local p0    # "this":Lorg/spongycastle/math/ec/LongArray;
    :cond_7
    invoke-virtual/range {p1 .. p1}, Lorg/spongycastle/math/ec/LongArray;->degree()I

    move-result v32

    .line 1357
    .local v32, "bDeg":I
    if-nez v32, :cond_10

    move-object/from16 p0, p1

    .line 1359
    goto :goto_6

    .line 1365
    :cond_10
    move-object/from16 v23, p0

    .local v23, "A":Lorg/spongycastle/math/ec/LongArray;
    move-object/from16 v24, p1

    .line 1366
    .local v24, "B":Lorg/spongycastle/math/ec/LongArray;
    move/from16 v0, v27

    move/from16 v1, v32

    if-le v0, v1, :cond_24

    .line 1368
    move-object/from16 v23, p1

    move-object/from16 v24, p0

    .line 1369
    move/from16 v36, v27

    .local v36, "tmp":I
    move/from16 v27, v32

    move/from16 v32, v36

    .line 1375
    .end local v36    # "tmp":I
    :cond_24
    add-int/lit8 v4, v27, 0x3f

    ushr-int/lit8 v28, v4, 0x6

    .line 1376
    .local v28, "aLen":I
    add-int/lit8 v4, v32, 0x3f

    ushr-int/lit8 v5, v4, 0x6

    .line 1377
    .local v5, "bLen":I
    add-int v4, v27, v32

    add-int/lit8 v4, v4, 0x3e

    ushr-int/lit8 v33, v4, 0x6

    .line 1379
    .local v33, "cLen":I
    const/4 v4, 0x1

    move/from16 v0, v28

    if-ne v0, v4, :cond_5e

    .line 1381
    move-object/from16 v0, v23

    iget-object v4, v0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    const/4 v8, 0x0

    aget-wide v2, v4, v8

    .line 1382
    .local v2, "a0":J
    const-wide/16 v8, 0x1

    cmp-long v4, v2, v8

    if-nez v4, :cond_47

    move-object/from16 p0, v24

    .line 1384
    goto :goto_6

    .line 1390
    :cond_47
    move/from16 v0, v33

    new-array v6, v0, [J

    .line 1391
    .local v6, "c0":[J
    move-object/from16 v0, v24

    iget-object v4, v0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    const/4 v7, 0x0

    invoke-static/range {v2 .. v7}, Lorg/spongycastle/math/ec/LongArray;->multiplyWord(J[JI[JI)V

    .line 1397
    new-instance p0, Lorg/spongycastle/math/ec/LongArray;

    .end local p0    # "this":Lorg/spongycastle/math/ec/LongArray;
    const/4 v4, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v33

    invoke-direct {v0, v6, v4, v1}, Lorg/spongycastle/math/ec/LongArray;-><init>([JII)V

    goto :goto_6

    .line 1403
    .end local v2    # "a0":J
    .end local v6    # "c0":[J
    .restart local p0    # "this":Lorg/spongycastle/math/ec/LongArray;
    :cond_5e
    add-int/lit8 v4, v32, 0x7

    add-int/lit8 v4, v4, 0x3f

    ushr-int/lit8 v11, v4, 0x6

    .line 1408
    .local v11, "bMax":I
    const/16 v4, 0x10

    new-array v0, v4, [I

    move-object/from16 v35, v0

    .line 1413
    .local v35, "ti":[I
    shl-int/lit8 v4, v11, 0x4

    new-array v7, v4, [J

    .line 1414
    .local v7, "T0":[J
    move v10, v11

    .line 1415
    .local v10, "tOff":I
    const/4 v4, 0x1

    aput v10, v35, v4

    .line 1416
    move-object/from16 v0, v24

    iget-object v4, v0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    const/4 v8, 0x0

    invoke-static {v4, v8, v7, v10, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1417
    const/16 v34, 0x2

    .local v34, "i":I
    :goto_7c
    const/16 v4, 0x10

    move/from16 v0, v34

    if-ge v0, v4, :cond_a2

    .line 1419
    add-int/2addr v10, v11

    aput v10, v35, v34

    .line 1420
    and-int/lit8 v4, v34, 0x1

    if-nez v4, :cond_93

    .line 1422
    ushr-int/lit8 v8, v10, 0x1

    const/4 v12, 0x1

    move-object v9, v7

    invoke-static/range {v7 .. v12}, Lorg/spongycastle/math/ec/LongArray;->shiftUp([JI[JIII)J

    .line 1417
    :goto_90
    add-int/lit8 v34, v34, 0x1

    goto :goto_7c

    .line 1426
    :cond_93
    sub-int v15, v10, v11

    move-object v12, v7

    move v13, v11

    move-object v14, v7

    move-object/from16 v16, v7

    move/from16 v17, v10

    move/from16 v18, v11

    invoke-static/range {v12 .. v18}, Lorg/spongycastle/math/ec/LongArray;->add([JI[JI[JII)V

    goto :goto_90

    .line 1433
    :cond_a2
    array-length v4, v7

    new-array v14, v4, [J

    .line 1434
    .local v14, "T1":[J
    const/4 v13, 0x0

    const/4 v15, 0x0

    array-length v0, v7

    move/from16 v16, v0

    const/16 v17, 0x4

    move-object v12, v7

    invoke-static/range {v12 .. v17}, Lorg/spongycastle/math/ec/LongArray;->shiftUp([JI[JIII)J

    .line 1437
    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    move-object/from16 v26, v0

    .line 1438
    .local v26, "a":[J
    shl-int/lit8 v4, v33, 0x3

    new-array v15, v4, [J

    .line 1440
    .local v15, "c":[J
    const/16 v25, 0xf

    .line 1446
    .local v25, "MASK":I
    const/16 v29, 0x0

    .local v29, "aPos":I
    :goto_be
    move/from16 v0, v29

    move/from16 v1, v28

    if-ge v0, v1, :cond_f1

    .line 1448
    aget-wide v30, v26, v29

    .line 1449
    .local v30, "aVal":J
    move/from16 v16, v29

    .line 1452
    .local v16, "cOff":I
    :goto_c8
    move-wide/from16 v0, v30

    long-to-int v4, v0

    and-int v37, v4, v25

    .line 1453
    .local v37, "u":I
    const/4 v4, 0x4

    ushr-long v30, v30, v4

    .line 1454
    move-wide/from16 v0, v30

    long-to-int v4, v0

    and-int v38, v4, v25

    .line 1455
    .local v38, "v":I
    aget v18, v35, v37

    aget v20, v35, v38

    move-object/from16 v17, v7

    move-object/from16 v19, v14

    move/from16 v21, v11

    invoke-static/range {v15 .. v21}, Lorg/spongycastle/math/ec/LongArray;->addBoth([JI[JI[JII)V

    .line 1456
    const/4 v4, 0x4

    ushr-long v30, v30, v4

    .line 1457
    const-wide/16 v8, 0x0

    cmp-long v4, v30, v8

    if-nez v4, :cond_ee

    .line 1446
    add-int/lit8 v29, v29, 0x1

    goto :goto_be

    .line 1461
    :cond_ee
    add-int v16, v16, v33

    .line 1462
    goto :goto_c8

    .line 1466
    .end local v16    # "cOff":I
    .end local v30    # "aVal":J
    .end local v37    # "u":I
    .end local v38    # "v":I
    :cond_f1
    array-length v0, v15

    move/from16 v16, v0

    .line 1467
    .restart local v16    # "cOff":I
    :goto_f4
    sub-int v16, v16, v33

    if-eqz v16, :cond_108

    .line 1469
    sub-int v18, v16, v33

    const/16 v22, 0x8

    move-object/from16 v17, v15

    move-object/from16 v19, v15

    move/from16 v20, v16

    move/from16 v21, v33

    invoke-static/range {v17 .. v22}, Lorg/spongycastle/math/ec/LongArray;->addShiftedUp([JI[JIII)J

    goto :goto_f4

    .line 1477
    :cond_108
    new-instance p0, Lorg/spongycastle/math/ec/LongArray;

    .end local p0    # "this":Lorg/spongycastle/math/ec/LongArray;
    const/4 v4, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v33

    invoke-direct {v0, v15, v4, v1}, Lorg/spongycastle/math/ec/LongArray;-><init>([JII)V

    goto/16 :goto_6
.end method

.method public reduce(I[I)V
    .registers 7
    .param p1, "m"    # I
    .param p2, "ks"    # [I

    .prologue
    const/4 v3, 0x0

    .line 1482
    iget-object v0, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    .line 1483
    .local v0, "buf":[J
    array-length v2, v0

    invoke-static {v0, v3, v2, p1, p2}, Lorg/spongycastle/math/ec/LongArray;->reduceInPlace([JIII[I)I

    move-result v1

    .line 1484
    .local v1, "rLen":I
    array-length v2, v0

    if-ge v1, v2, :cond_14

    .line 1486
    new-array v2, v1, [J

    iput-object v2, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    .line 1487
    iget-object v2, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1489
    :cond_14
    return-void
.end method

.method public square(I[I)Lorg/spongycastle/math/ec/LongArray;
    .registers 12
    .param p1, "m"    # I
    .param p2, "ks"    # [I

    .prologue
    .line 1704
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/LongArray;->getUsedLength()I

    move-result v1

    .line 1705
    .local v1, "len":I
    if-nez v1, :cond_7

    .line 1721
    .end local p0    # "this":Lorg/spongycastle/math/ec/LongArray;
    :goto_6
    return-object p0

    .line 1710
    .restart local p0    # "this":Lorg/spongycastle/math/ec/LongArray;
    :cond_7
    shl-int/lit8 v0, v1, 0x1

    .line 1711
    .local v0, "_2len":I
    new-array v6, v0, [J

    .line 1713
    .local v6, "r":[J
    const/4 v4, 0x0

    .local v4, "pos":I
    move v5, v4

    .line 1714
    .end local v4    # "pos":I
    .local v5, "pos":I
    :goto_d
    if-ge v5, v0, :cond_2c

    .line 1716
    iget-object v7, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    ushr-int/lit8 v8, v5, 0x1

    aget-wide v2, v7, v8

    .line 1717
    .local v2, "mi":J
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "pos":I
    .restart local v4    # "pos":I
    long-to-int v7, v2

    invoke-static {v7}, Lorg/spongycastle/math/ec/LongArray;->interleave2_32to64(I)J

    move-result-wide v7

    aput-wide v7, v6, v5

    .line 1718
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "pos":I
    .restart local v5    # "pos":I
    const/16 v7, 0x20

    ushr-long v7, v2, v7

    long-to-int v7, v7

    invoke-static {v7}, Lorg/spongycastle/math/ec/LongArray;->interleave2_32to64(I)J

    move-result-wide v7

    aput-wide v7, v6, v4

    goto :goto_d

    .line 1721
    .end local v2    # "mi":J
    :cond_2c
    new-instance p0, Lorg/spongycastle/math/ec/LongArray;

    .end local p0    # "this":Lorg/spongycastle/math/ec/LongArray;
    const/4 v7, 0x0

    array-length v8, v6

    invoke-direct {p0, v6, v7, v8}, Lorg/spongycastle/math/ec/LongArray;-><init>([JII)V

    goto :goto_6
.end method

.method public testBitZero()Z
    .registers 6

    .prologue
    const/4 v0, 0x0

    .line 794
    iget-object v1, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    array-length v1, v1

    if-lez v1, :cond_14

    iget-object v1, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    aget-wide v1, v1, v0

    const-wide/16 v3, 0x1

    and-long/2addr v1, v3

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_14

    const/4 v0, 0x1

    :cond_14
    return v0
.end method

.method public toBigInteger()Ljava/math/BigInteger;
    .registers 18

    .prologue
    .line 537
    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/math/ec/LongArray;->getUsedLength()I

    move-result v14

    .line 538
    .local v14, "usedLen":I
    if-nez v14, :cond_9

    .line 540
    sget-object v15, Lorg/spongycastle/math/ec/ECConstants;->ZERO:Ljava/math/BigInteger;

    .line 573
    :goto_8
    return-object v15

    .line 543
    :cond_9
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    add-int/lit8 v16, v14, -0x1

    aget-wide v5, v15, v16

    .line 544
    .local v5, "highestInt":J
    const/16 v15, 0x8

    new-array v11, v15, [B

    .line 545
    .local v11, "temp":[B
    const/4 v2, 0x0

    .line 546
    .local v2, "barrI":I
    const/4 v13, 0x0

    .line 547
    .local v13, "trailingZeroBytesDone":Z
    const/4 v8, 0x7

    .local v8, "j":I
    move v3, v2

    .end local v2    # "barrI":I
    .local v3, "barrI":I
    :goto_19
    if-ltz v8, :cond_2e

    .line 549
    mul-int/lit8 v15, v8, 0x8

    ushr-long v15, v5, v15

    long-to-int v15, v15

    int-to-byte v12, v15

    .line 550
    .local v12, "thisByte":B
    if-nez v13, :cond_25

    if-eqz v12, :cond_6b

    .line 552
    :cond_25
    const/4 v13, 0x1

    .line 553
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "barrI":I
    .restart local v2    # "barrI":I
    aput-byte v12, v11, v3

    .line 547
    :goto_2a
    add-int/lit8 v8, v8, -0x1

    move v3, v2

    .end local v2    # "barrI":I
    .restart local v3    # "barrI":I
    goto :goto_19

    .line 557
    .end local v12    # "thisByte":B
    :cond_2e
    add-int/lit8 v15, v14, -0x1

    mul-int/lit8 v15, v15, 0x8

    add-int v4, v15, v3

    .line 558
    .local v4, "barrLen":I
    new-array v1, v4, [B

    .line 559
    .local v1, "barr":[B
    const/4 v8, 0x0

    :goto_37
    if-ge v8, v3, :cond_40

    .line 561
    aget-byte v15, v11, v8

    aput-byte v15, v1, v8

    .line 559
    add-int/lit8 v8, v8, 0x1

    goto :goto_37

    .line 565
    :cond_40
    add-int/lit8 v7, v14, -0x2

    .local v7, "iarrJ":I
    move v2, v3

    .end local v3    # "barrI":I
    .restart local v2    # "barrI":I
    :goto_43
    if-ltz v7, :cond_61

    .line 567
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    aget-wide v9, v15, v7

    .line 568
    .local v9, "mi":J
    const/4 v8, 0x7

    move v3, v2

    .end local v2    # "barrI":I
    .restart local v3    # "barrI":I
    :goto_4d
    if-ltz v8, :cond_5d

    .line 570
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "barrI":I
    .restart local v2    # "barrI":I
    mul-int/lit8 v15, v8, 0x8

    ushr-long v15, v9, v15

    long-to-int v15, v15

    int-to-byte v15, v15

    aput-byte v15, v1, v3

    .line 568
    add-int/lit8 v8, v8, -0x1

    move v3, v2

    .end local v2    # "barrI":I
    .restart local v3    # "barrI":I
    goto :goto_4d

    .line 565
    :cond_5d
    add-int/lit8 v7, v7, -0x1

    move v2, v3

    .end local v3    # "barrI":I
    .restart local v2    # "barrI":I
    goto :goto_43

    .line 573
    .end local v9    # "mi":J
    :cond_61
    new-instance v15, Ljava/math/BigInteger;

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-direct {v15, v0, v1}, Ljava/math/BigInteger;-><init>(I[B)V

    goto :goto_8

    .end local v1    # "barr":[B
    .end local v2    # "barrI":I
    .end local v4    # "barrLen":I
    .end local v7    # "iarrJ":I
    .restart local v3    # "barrI":I
    .restart local v12    # "thisByte":B
    :cond_6b
    move v2, v3

    .end local v3    # "barrI":I
    .restart local v2    # "barrI":I
    goto :goto_2a
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    .prologue
    .line 2175
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/LongArray;->getUsedLength()I

    move-result v0

    .line 2176
    .local v0, "i":I
    if-nez v0, :cond_9

    .line 2178
    const-string v4, "0"

    .line 2195
    :goto_8
    return-object v4

    .line 2181
    :cond_9
    new-instance v3, Ljava/lang/StringBuffer;

    iget-object v4, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    add-int/lit8 v0, v0, -0x1

    aget-wide v4, v4, v0

    invoke-static {v4, v5}, Ljava/lang/Long;->toBinaryString(J)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 2182
    .local v3, "sb":Ljava/lang/StringBuffer;
    :goto_18
    add-int/lit8 v0, v0, -0x1

    if-ltz v0, :cond_39

    .line 2184
    iget-object v4, p0, Lorg/spongycastle/math/ec/LongArray;->m_ints:[J

    aget-wide v4, v4, v0

    invoke-static {v4, v5}, Ljava/lang/Long;->toBinaryString(J)Ljava/lang/String;

    move-result-object v2

    .line 2187
    .local v2, "s":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    .line 2188
    .local v1, "len":I
    const/16 v4, 0x40

    if-ge v1, v4, :cond_35

    .line 2190
    const-string v4, "0000000000000000000000000000000000000000000000000000000000000000"

    invoke-virtual {v4, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2193
    :cond_35
    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_18

    .line 2195
    .end local v1    # "len":I
    .end local v2    # "s":Ljava/lang/String;
    :cond_39
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_8
.end method
