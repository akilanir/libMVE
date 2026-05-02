.class public Lorg/spongycastle/crypto/engines/RijndaelEngine;
.super Ljava/lang/Object;
.source "RijndaelEngine.java"

# interfaces
.implements Lorg/spongycastle/crypto/BlockCipher;


# static fields
.field private static final MAXKC:I = 0x40

.field private static final MAXROUNDS:I = 0xe

.field private static final S:[B

.field private static final Si:[B

.field private static final aLogtable:[B

.field private static final logtable:[B

.field private static final rcon:[I

.field static shifts0:[[B

.field static shifts1:[[B


# instance fields
.field private A0:J

.field private A1:J

.field private A2:J

.field private A3:J

.field private BC:I

.field private BC_MASK:J

.field private ROUNDS:I

.field private blockBits:I

.field private forEncryption:Z

.field private shifts0SC:[B

.field private shifts1SC:[B

.field private workingKey:[[J


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    const/16 v1, 0x100

    const/4 v3, 0x4

    .line 22
    new-array v0, v1, [B

    fill-array-data v0, :array_80

    sput-object v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->logtable:[B

    .line 57
    const/16 v0, 0x1ff

    new-array v0, v0, [B

    fill-array-data v0, :array_104

    sput-object v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->aLogtable:[B

    .line 92
    new-array v0, v1, [B

    fill-array-data v0, :array_208

    sput-object v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->S:[B

    .line 111
    new-array v0, v1, [B

    fill-array-data v0, :array_28c

    sput-object v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->Si:[B

    .line 130
    const/16 v0, 0x1e

    new-array v0, v0, [I

    fill-array-data v0, :array_310

    sput-object v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->rcon:[I

    .line 133
    const/4 v0, 0x5

    new-array v0, v0, [[B

    new-array v1, v3, [B

    fill-array-data v1, :array_350

    aput-object v1, v0, v4

    new-array v1, v3, [B

    fill-array-data v1, :array_356

    aput-object v1, v0, v5

    new-array v1, v3, [B

    fill-array-data v1, :array_35c

    aput-object v1, v0, v6

    const/4 v1, 0x3

    new-array v2, v3, [B

    fill-array-data v2, :array_362

    aput-object v2, v0, v1

    new-array v1, v3, [B

    fill-array-data v1, :array_368

    aput-object v1, v0, v3

    sput-object v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shifts0:[[B

    .line 142
    const/4 v0, 0x5

    new-array v0, v0, [[B

    new-array v1, v3, [B

    fill-array-data v1, :array_36e

    aput-object v1, v0, v4

    new-array v1, v3, [B

    fill-array-data v1, :array_374

    aput-object v1, v0, v5

    new-array v1, v3, [B

    fill-array-data v1, :array_37a

    aput-object v1, v0, v6

    const/4 v1, 0x3

    new-array v2, v3, [B

    fill-array-data v2, :array_380

    aput-object v2, v0, v1

    new-array v1, v3, [B

    fill-array-data v1, :array_386

    aput-object v1, v0, v3

    sput-object v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shifts1:[[B

    return-void

    .line 22
    :array_80
    .array-data 1
        0x0t
        0x0t
        0x19t
        0x1t
        0x32t
        0x2t
        0x1at
        -0x3at
        0x4bt
        -0x39t
        0x1bt
        0x68t
        0x33t
        -0x12t
        -0x21t
        0x3t
        0x64t
        0x4t
        -0x20t
        0xet
        0x34t
        -0x73t
        -0x7ft
        -0x11t
        0x4ct
        0x71t
        0x8t
        -0x38t
        -0x8t
        0x69t
        0x1ct
        -0x3ft
        0x7dt
        -0x3et
        0x1dt
        -0x4bt
        -0x7t
        -0x47t
        0x27t
        0x6at
        0x4dt
        -0x1ct
        -0x5at
        0x72t
        -0x66t
        -0x37t
        0x9t
        0x78t
        0x65t
        0x2ft
        -0x76t
        0x5t
        0x21t
        0xft
        -0x1ft
        0x24t
        0x12t
        -0x10t
        -0x7et
        0x45t
        0x35t
        -0x6dt
        -0x26t
        -0x72t
        -0x6at
        -0x71t
        -0x25t
        -0x43t
        0x36t
        -0x30t
        -0x32t
        -0x6ct
        0x13t
        0x5ct
        -0x2et
        -0xft
        0x40t
        0x46t
        -0x7dt
        0x38t
        0x66t
        -0x23t
        -0x3t
        0x30t
        -0x41t
        0x6t
        -0x75t
        0x62t
        -0x4dt
        0x25t
        -0x1et
        -0x68t
        0x22t
        -0x78t
        -0x6ft
        0x10t
        0x7et
        0x6et
        0x48t
        -0x3dt
        -0x5dt
        -0x4at
        0x1et
        0x42t
        0x3at
        0x6bt
        0x28t
        0x54t
        -0x6t
        -0x7bt
        0x3dt
        -0x46t
        0x2bt
        0x79t
        0xat
        0x15t
        -0x65t
        -0x61t
        0x5et
        -0x36t
        0x4et
        -0x2ct
        -0x54t
        -0x1bt
        -0xdt
        0x73t
        -0x59t
        0x57t
        -0x51t
        0x58t
        -0x58t
        0x50t
        -0xct
        -0x16t
        -0x2at
        0x74t
        0x4ft
        -0x52t
        -0x17t
        -0x2bt
        -0x19t
        -0x1at
        -0x53t
        -0x18t
        0x2ct
        -0x29t
        0x75t
        0x7at
        -0x15t
        0x16t
        0xbt
        -0xbt
        0x59t
        -0x35t
        0x5ft
        -0x50t
        -0x64t
        -0x57t
        0x51t
        -0x60t
        0x7ft
        0xct
        -0xat
        0x6ft
        0x17t
        -0x3ct
        0x49t
        -0x14t
        -0x28t
        0x43t
        0x1ft
        0x2dt
        -0x5ct
        0x76t
        0x7bt
        -0x49t
        -0x34t
        -0x45t
        0x3et
        0x5at
        -0x5t
        0x60t
        -0x4ft
        -0x7at
        0x3bt
        0x52t
        -0x5ft
        0x6ct
        -0x56t
        0x55t
        0x29t
        -0x63t
        -0x69t
        -0x4et
        -0x79t
        -0x70t
        0x61t
        -0x42t
        -0x24t
        -0x4t
        -0x44t
        -0x6bt
        -0x31t
        -0x33t
        0x37t
        0x3ft
        0x5bt
        -0x2ft
        0x53t
        0x39t
        -0x7ct
        0x3ct
        0x41t
        -0x5et
        0x6dt
        0x47t
        0x14t
        0x2at
        -0x62t
        0x5dt
        0x56t
        -0xet
        -0x2dt
        -0x55t
        0x44t
        0x11t
        -0x6et
        -0x27t
        0x23t
        0x20t
        0x2et
        -0x77t
        -0x4ct
        0x7ct
        -0x48t
        0x26t
        0x77t
        -0x67t
        -0x1dt
        -0x5bt
        0x67t
        0x4at
        -0x13t
        -0x22t
        -0x3bt
        0x31t
        -0x2t
        0x18t
        0xdt
        0x63t
        -0x74t
        -0x80t
        -0x40t
        -0x9t
        0x70t
        0x7t
    .end array-data

    .line 57
    :array_104
    .array-data 1
        0x0t
        0x3t
        0x5t
        0xft
        0x11t
        0x33t
        0x55t
        -0x1t
        0x1at
        0x2et
        0x72t
        -0x6at
        -0x5ft
        -0x8t
        0x13t
        0x35t
        0x5ft
        -0x1ft
        0x38t
        0x48t
        -0x28t
        0x73t
        -0x6bt
        -0x5ct
        -0x9t
        0x2t
        0x6t
        0xat
        0x1et
        0x22t
        0x66t
        -0x56t
        -0x1bt
        0x34t
        0x5ct
        -0x1ct
        0x37t
        0x59t
        -0x15t
        0x26t
        0x6at
        -0x42t
        -0x27t
        0x70t
        -0x70t
        -0x55t
        -0x1at
        0x31t
        0x53t
        -0xbt
        0x4t
        0xct
        0x14t
        0x3ct
        0x44t
        -0x34t
        0x4ft
        -0x2ft
        0x68t
        -0x48t
        -0x2dt
        0x6et
        -0x4et
        -0x33t
        0x4ct
        -0x2ct
        0x67t
        -0x57t
        -0x20t
        0x3bt
        0x4dt
        -0x29t
        0x62t
        -0x5at
        -0xft
        0x8t
        0x18t
        0x28t
        0x78t
        -0x78t
        -0x7dt
        -0x62t
        -0x47t
        -0x30t
        0x6bt
        -0x43t
        -0x24t
        0x7ft
        -0x7ft
        -0x68t
        -0x4dt
        -0x32t
        0x49t
        -0x25t
        0x76t
        -0x66t
        -0x4bt
        -0x3ct
        0x57t
        -0x7t
        0x10t
        0x30t
        0x50t
        -0x10t
        0xbt
        0x1dt
        0x27t
        0x69t
        -0x45t
        -0x2at
        0x61t
        -0x5dt
        -0x2t
        0x19t
        0x2bt
        0x7dt
        -0x79t
        -0x6et
        -0x53t
        -0x14t
        0x2ft
        0x71t
        -0x6dt
        -0x52t
        -0x17t
        0x20t
        0x60t
        -0x60t
        -0x5t
        0x16t
        0x3at
        0x4et
        -0x2et
        0x6dt
        -0x49t
        -0x3et
        0x5dt
        -0x19t
        0x32t
        0x56t
        -0x6t
        0x15t
        0x3ft
        0x41t
        -0x3dt
        0x5et
        -0x1et
        0x3dt
        0x47t
        -0x37t
        0x40t
        -0x40t
        0x5bt
        -0x13t
        0x2ct
        0x74t
        -0x64t
        -0x41t
        -0x26t
        0x75t
        -0x61t
        -0x46t
        -0x2bt
        0x64t
        -0x54t
        -0x11t
        0x2at
        0x7et
        -0x7et
        -0x63t
        -0x44t
        -0x21t
        0x7at
        -0x72t
        -0x77t
        -0x80t
        -0x65t
        -0x4at
        -0x3ft
        0x58t
        -0x18t
        0x23t
        0x65t
        -0x51t
        -0x16t
        0x25t
        0x6ft
        -0x4ft
        -0x38t
        0x43t
        -0x3bt
        0x54t
        -0x4t
        0x1ft
        0x21t
        0x63t
        -0x5bt
        -0xct
        0x7t
        0x9t
        0x1bt
        0x2dt
        0x77t
        -0x67t
        -0x50t
        -0x35t
        0x46t
        -0x36t
        0x45t
        -0x31t
        0x4at
        -0x22t
        0x79t
        -0x75t
        -0x7at
        -0x6ft
        -0x58t
        -0x1dt
        0x3et
        0x42t
        -0x3at
        0x51t
        -0xdt
        0xet
        0x12t
        0x36t
        0x5at
        -0x12t
        0x29t
        0x7bt
        -0x73t
        -0x74t
        -0x71t
        -0x76t
        -0x7bt
        -0x6ct
        -0x59t
        -0xet
        0xdt
        0x17t
        0x39t
        0x4bt
        -0x23t
        0x7ct
        -0x7ct
        -0x69t
        -0x5et
        -0x3t
        0x1ct
        0x24t
        0x6ct
        -0x4ct
        -0x39t
        0x52t
        -0xat
        0x1t
        0x3t
        0x5t
        0xft
        0x11t
        0x33t
        0x55t
        -0x1t
        0x1at
        0x2et
        0x72t
        -0x6at
        -0x5ft
        -0x8t
        0x13t
        0x35t
        0x5ft
        -0x1ft
        0x38t
        0x48t
        -0x28t
        0x73t
        -0x6bt
        -0x5ct
        -0x9t
        0x2t
        0x6t
        0xat
        0x1et
        0x22t
        0x66t
        -0x56t
        -0x1bt
        0x34t
        0x5ct
        -0x1ct
        0x37t
        0x59t
        -0x15t
        0x26t
        0x6at
        -0x42t
        -0x27t
        0x70t
        -0x70t
        -0x55t
        -0x1at
        0x31t
        0x53t
        -0xbt
        0x4t
        0xct
        0x14t
        0x3ct
        0x44t
        -0x34t
        0x4ft
        -0x2ft
        0x68t
        -0x48t
        -0x2dt
        0x6et
        -0x4et
        -0x33t
        0x4ct
        -0x2ct
        0x67t
        -0x57t
        -0x20t
        0x3bt
        0x4dt
        -0x29t
        0x62t
        -0x5at
        -0xft
        0x8t
        0x18t
        0x28t
        0x78t
        -0x78t
        -0x7dt
        -0x62t
        -0x47t
        -0x30t
        0x6bt
        -0x43t
        -0x24t
        0x7ft
        -0x7ft
        -0x68t
        -0x4dt
        -0x32t
        0x49t
        -0x25t
        0x76t
        -0x66t
        -0x4bt
        -0x3ct
        0x57t
        -0x7t
        0x10t
        0x30t
        0x50t
        -0x10t
        0xbt
        0x1dt
        0x27t
        0x69t
        -0x45t
        -0x2at
        0x61t
        -0x5dt
        -0x2t
        0x19t
        0x2bt
        0x7dt
        -0x79t
        -0x6et
        -0x53t
        -0x14t
        0x2ft
        0x71t
        -0x6dt
        -0x52t
        -0x17t
        0x20t
        0x60t
        -0x60t
        -0x5t
        0x16t
        0x3at
        0x4et
        -0x2et
        0x6dt
        -0x49t
        -0x3et
        0x5dt
        -0x19t
        0x32t
        0x56t
        -0x6t
        0x15t
        0x3ft
        0x41t
        -0x3dt
        0x5et
        -0x1et
        0x3dt
        0x47t
        -0x37t
        0x40t
        -0x40t
        0x5bt
        -0x13t
        0x2ct
        0x74t
        -0x64t
        -0x41t
        -0x26t
        0x75t
        -0x61t
        -0x46t
        -0x2bt
        0x64t
        -0x54t
        -0x11t
        0x2at
        0x7et
        -0x7et
        -0x63t
        -0x44t
        -0x21t
        0x7at
        -0x72t
        -0x77t
        -0x80t
        -0x65t
        -0x4at
        -0x3ft
        0x58t
        -0x18t
        0x23t
        0x65t
        -0x51t
        -0x16t
        0x25t
        0x6ft
        -0x4ft
        -0x38t
        0x43t
        -0x3bt
        0x54t
        -0x4t
        0x1ft
        0x21t
        0x63t
        -0x5bt
        -0xct
        0x7t
        0x9t
        0x1bt
        0x2dt
        0x77t
        -0x67t
        -0x50t
        -0x35t
        0x46t
        -0x36t
        0x45t
        -0x31t
        0x4at
        -0x22t
        0x79t
        -0x75t
        -0x7at
        -0x6ft
        -0x58t
        -0x1dt
        0x3et
        0x42t
        -0x3at
        0x51t
        -0xdt
        0xet
        0x12t
        0x36t
        0x5at
        -0x12t
        0x29t
        0x7bt
        -0x73t
        -0x74t
        -0x71t
        -0x76t
        -0x7bt
        -0x6ct
        -0x59t
        -0xet
        0xdt
        0x17t
        0x39t
        0x4bt
        -0x23t
        0x7ct
        -0x7ct
        -0x69t
        -0x5et
        -0x3t
        0x1ct
        0x24t
        0x6ct
        -0x4ct
        -0x39t
        0x52t
        -0xat
        0x1t
    .end array-data

    .line 92
    :array_208
    .array-data 1
        0x63t
        0x7ct
        0x77t
        0x7bt
        -0xet
        0x6bt
        0x6ft
        -0x3bt
        0x30t
        0x1t
        0x67t
        0x2bt
        -0x2t
        -0x29t
        -0x55t
        0x76t
        -0x36t
        -0x7et
        -0x37t
        0x7dt
        -0x6t
        0x59t
        0x47t
        -0x10t
        -0x53t
        -0x2ct
        -0x5et
        -0x51t
        -0x64t
        -0x5ct
        0x72t
        -0x40t
        -0x49t
        -0x3t
        -0x6dt
        0x26t
        0x36t
        0x3ft
        -0x9t
        -0x34t
        0x34t
        -0x5bt
        -0x1bt
        -0xft
        0x71t
        -0x28t
        0x31t
        0x15t
        0x4t
        -0x39t
        0x23t
        -0x3dt
        0x18t
        -0x6at
        0x5t
        -0x66t
        0x7t
        0x12t
        -0x80t
        -0x1et
        -0x15t
        0x27t
        -0x4et
        0x75t
        0x9t
        -0x7dt
        0x2ct
        0x1at
        0x1bt
        0x6et
        0x5at
        -0x60t
        0x52t
        0x3bt
        -0x2at
        -0x4dt
        0x29t
        -0x1dt
        0x2ft
        -0x7ct
        0x53t
        -0x2ft
        0x0t
        -0x13t
        0x20t
        -0x4t
        -0x4ft
        0x5bt
        0x6at
        -0x35t
        -0x42t
        0x39t
        0x4at
        0x4ct
        0x58t
        -0x31t
        -0x30t
        -0x11t
        -0x56t
        -0x5t
        0x43t
        0x4dt
        0x33t
        -0x7bt
        0x45t
        -0x7t
        0x2t
        0x7ft
        0x50t
        0x3ct
        -0x61t
        -0x58t
        0x51t
        -0x5dt
        0x40t
        -0x71t
        -0x6et
        -0x63t
        0x38t
        -0xbt
        -0x44t
        -0x4at
        -0x26t
        0x21t
        0x10t
        -0x1t
        -0xdt
        -0x2et
        -0x33t
        0xct
        0x13t
        -0x14t
        0x5ft
        -0x69t
        0x44t
        0x17t
        -0x3ct
        -0x59t
        0x7et
        0x3dt
        0x64t
        0x5dt
        0x19t
        0x73t
        0x60t
        -0x7ft
        0x4ft
        -0x24t
        0x22t
        0x2at
        -0x70t
        -0x78t
        0x46t
        -0x12t
        -0x48t
        0x14t
        -0x22t
        0x5et
        0xbt
        -0x25t
        -0x20t
        0x32t
        0x3at
        0xat
        0x49t
        0x6t
        0x24t
        0x5ct
        -0x3et
        -0x2dt
        -0x54t
        0x62t
        -0x6ft
        -0x6bt
        -0x1ct
        0x79t
        -0x19t
        -0x38t
        0x37t
        0x6dt
        -0x73t
        -0x2bt
        0x4et
        -0x57t
        0x6ct
        0x56t
        -0xct
        -0x16t
        0x65t
        0x7at
        -0x52t
        0x8t
        -0x46t
        0x78t
        0x25t
        0x2et
        0x1ct
        -0x5at
        -0x4ct
        -0x3at
        -0x18t
        -0x23t
        0x74t
        0x1ft
        0x4bt
        -0x43t
        -0x75t
        -0x76t
        0x70t
        0x3et
        -0x4bt
        0x66t
        0x48t
        0x3t
        -0xat
        0xet
        0x61t
        0x35t
        0x57t
        -0x47t
        -0x7at
        -0x3ft
        0x1dt
        -0x62t
        -0x1ft
        -0x8t
        -0x68t
        0x11t
        0x69t
        -0x27t
        -0x72t
        -0x6ct
        -0x65t
        0x1et
        -0x79t
        -0x17t
        -0x32t
        0x55t
        0x28t
        -0x21t
        -0x74t
        -0x5ft
        -0x77t
        0xdt
        -0x41t
        -0x1at
        0x42t
        0x68t
        0x41t
        -0x67t
        0x2dt
        0xft
        -0x50t
        0x54t
        -0x45t
        0x16t
    .end array-data

    .line 111
    :array_28c
    .array-data 1
        0x52t
        0x9t
        0x6at
        -0x2bt
        0x30t
        0x36t
        -0x5bt
        0x38t
        -0x41t
        0x40t
        -0x5dt
        -0x62t
        -0x7ft
        -0xdt
        -0x29t
        -0x5t
        0x7ct
        -0x1dt
        0x39t
        -0x7et
        -0x65t
        0x2ft
        -0x1t
        -0x79t
        0x34t
        -0x72t
        0x43t
        0x44t
        -0x3ct
        -0x22t
        -0x17t
        -0x35t
        0x54t
        0x7bt
        -0x6ct
        0x32t
        -0x5at
        -0x3et
        0x23t
        0x3dt
        -0x12t
        0x4ct
        -0x6bt
        0xbt
        0x42t
        -0x6t
        -0x3dt
        0x4et
        0x8t
        0x2et
        -0x5ft
        0x66t
        0x28t
        -0x27t
        0x24t
        -0x4et
        0x76t
        0x5bt
        -0x5et
        0x49t
        0x6dt
        -0x75t
        -0x2ft
        0x25t
        0x72t
        -0x8t
        -0xat
        0x64t
        -0x7at
        0x68t
        -0x68t
        0x16t
        -0x2ct
        -0x5ct
        0x5ct
        -0x34t
        0x5dt
        0x65t
        -0x4at
        -0x6et
        0x6ct
        0x70t
        0x48t
        0x50t
        -0x3t
        -0x13t
        -0x47t
        -0x26t
        0x5et
        0x15t
        0x46t
        0x57t
        -0x59t
        -0x73t
        -0x63t
        -0x7ct
        -0x70t
        -0x28t
        -0x55t
        0x0t
        -0x74t
        -0x44t
        -0x2dt
        0xat
        -0x9t
        -0x1ct
        0x58t
        0x5t
        -0x48t
        -0x4dt
        0x45t
        0x6t
        -0x30t
        0x2ct
        0x1et
        -0x71t
        -0x36t
        0x3ft
        0xft
        0x2t
        -0x3ft
        -0x51t
        -0x43t
        0x3t
        0x1t
        0x13t
        -0x76t
        0x6bt
        0x3at
        -0x6ft
        0x11t
        0x41t
        0x4ft
        0x67t
        -0x24t
        -0x16t
        -0x69t
        -0xet
        -0x31t
        -0x32t
        -0x10t
        -0x4ct
        -0x1at
        0x73t
        -0x6at
        -0x54t
        0x74t
        0x22t
        -0x19t
        -0x53t
        0x35t
        -0x7bt
        -0x1et
        -0x7t
        0x37t
        -0x18t
        0x1ct
        0x75t
        -0x21t
        0x6et
        0x47t
        -0xft
        0x1at
        0x71t
        0x1dt
        0x29t
        -0x3bt
        -0x77t
        0x6ft
        -0x49t
        0x62t
        0xet
        -0x56t
        0x18t
        -0x42t
        0x1bt
        -0x4t
        0x56t
        0x3et
        0x4bt
        -0x3at
        -0x2et
        0x79t
        0x20t
        -0x66t
        -0x25t
        -0x40t
        -0x2t
        0x78t
        -0x33t
        0x5at
        -0xct
        0x1ft
        -0x23t
        -0x58t
        0x33t
        -0x78t
        0x7t
        -0x39t
        0x31t
        -0x4ft
        0x12t
        0x10t
        0x59t
        0x27t
        -0x80t
        -0x14t
        0x5ft
        0x60t
        0x51t
        0x7ft
        -0x57t
        0x19t
        -0x4bt
        0x4at
        0xdt
        0x2dt
        -0x1bt
        0x7at
        -0x61t
        -0x6dt
        -0x37t
        -0x64t
        -0x11t
        -0x60t
        -0x20t
        0x3bt
        0x4dt
        -0x52t
        0x2at
        -0xbt
        -0x50t
        -0x38t
        -0x15t
        -0x45t
        0x3ct
        -0x7dt
        0x53t
        -0x67t
        0x61t
        0x17t
        0x2bt
        0x4t
        0x7et
        -0x46t
        0x77t
        -0x2at
        0x26t
        -0x1ft
        0x69t
        0x14t
        0x63t
        0x55t
        0x21t
        0xct
        0x7dt
    .end array-data

    .line 130
    :array_310
    .array-data 4
        0x1
        0x2
        0x4
        0x8
        0x10
        0x20
        0x40
        0x80
        0x1b
        0x36
        0x6c
        0xd8
        0xab
        0x4d
        0x9a
        0x2f
        0x5e
        0xbc
        0x63
        0xc6
        0x97
        0x35
        0x6a
        0xd4
        0xb3
        0x7d
        0xfa
        0xef
        0xc5
        0x91
    .end array-data

    .line 133
    :array_350
    .array-data 1
        0x0t
        0x8t
        0x10t
        0x18t
    .end array-data

    :array_356
    .array-data 1
        0x0t
        0x8t
        0x10t
        0x18t
    .end array-data

    :array_35c
    .array-data 1
        0x0t
        0x8t
        0x10t
        0x18t
    .end array-data

    :array_362
    .array-data 1
        0x0t
        0x8t
        0x10t
        0x20t
    .end array-data

    :array_368
    .array-data 1
        0x0t
        0x8t
        0x18t
        0x20t
    .end array-data

    .line 142
    :array_36e
    .array-data 1
        0x0t
        0x18t
        0x10t
        0x8t
    .end array-data

    :array_374
    .array-data 1
        0x0t
        0x20t
        0x18t
        0x10t
    .end array-data

    :array_37a
    .array-data 1
        0x0t
        0x28t
        0x20t
        0x18t
    .end array-data

    :array_380
    .array-data 1
        0x0t
        0x30t
        0x28t
        0x18t
    .end array-data

    :array_386
    .array-data 1
        0x0t
        0x38t
        0x28t
        0x20t
    .end array-data
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 501
    const/16 v0, 0x80

    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/engines/RijndaelEngine;-><init>(I)V

    .line 502
    return-void
.end method

.method public constructor <init>(I)V
    .registers 9
    .param p1, "blockBits"    # I

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 511
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 512
    sparse-switch p1, :sswitch_data_8a

    .line 545
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "unknown blocksize to Rijndael"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 515
    :sswitch_13
    const/16 v0, 0x20

    iput v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC:I

    .line 516
    const-wide v0, 0xffffffffL

    iput-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC_MASK:J

    .line 517
    sget-object v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shifts0:[[B

    aget-object v0, v0, v2

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shifts0SC:[B

    .line 518
    sget-object v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shifts1:[[B

    aget-object v0, v0, v2

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shifts1SC:[B

    .line 548
    :goto_2a
    iput p1, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->blockBits:I

    .line 549
    return-void

    .line 521
    :sswitch_2d
    const/16 v0, 0x28

    iput v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC:I

    .line 522
    const-wide v0, 0xffffffffffL

    iput-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC_MASK:J

    .line 523
    sget-object v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shifts0:[[B

    aget-object v0, v0, v3

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shifts0SC:[B

    .line 524
    sget-object v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shifts1:[[B

    aget-object v0, v0, v3

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shifts1SC:[B

    goto :goto_2a

    .line 527
    :sswitch_45
    const/16 v0, 0x30

    iput v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC:I

    .line 528
    const-wide v0, 0xffffffffffffL

    iput-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC_MASK:J

    .line 529
    sget-object v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shifts0:[[B

    aget-object v0, v0, v4

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shifts0SC:[B

    .line 530
    sget-object v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shifts1:[[B

    aget-object v0, v0, v4

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shifts1SC:[B

    goto :goto_2a

    .line 533
    :sswitch_5d
    const/16 v0, 0x38

    iput v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC:I

    .line 534
    const-wide v0, 0xffffffffffffffL

    iput-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC_MASK:J

    .line 535
    sget-object v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shifts0:[[B

    aget-object v0, v0, v5

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shifts0SC:[B

    .line 536
    sget-object v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shifts1:[[B

    aget-object v0, v0, v5

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shifts1SC:[B

    goto :goto_2a

    .line 539
    :sswitch_75
    const/16 v0, 0x40

    iput v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC:I

    .line 540
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC_MASK:J

    .line 541
    sget-object v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shifts0:[[B

    aget-object v0, v0, v6

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shifts0SC:[B

    .line 542
    sget-object v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shifts1:[[B

    aget-object v0, v0, v6

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shifts1SC:[B

    goto :goto_2a

    .line 512
    :sswitch_data_8a
    .sparse-switch
        0x80 -> :sswitch_13
        0xa0 -> :sswitch_2d
        0xc0 -> :sswitch_45
        0xe0 -> :sswitch_5d
        0x100 -> :sswitch_75
    .end sparse-switch
.end method

.method private InvMixColumn()V
    .registers 19

    .prologue
    .line 330
    const-wide/16 v12, 0x0

    .local v12, "r3":J
    move-wide v10, v12

    .local v10, "r2":J
    move-wide v8, v12

    .local v8, "r1":J
    move-wide v6, v12

    .line 331
    .local v6, "r0":J
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_6
    move-object/from16 v0, p0

    iget v14, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC:I

    if-ge v5, v14, :cond_ec

    .line 333
    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A0:J

    shr-long/2addr v14, v5

    const-wide/16 v16, 0xff

    and-long v14, v14, v16

    long-to-int v1, v14

    .line 334
    .local v1, "a0":I
    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A1:J

    shr-long/2addr v14, v5

    const-wide/16 v16, 0xff

    and-long v14, v14, v16

    long-to-int v2, v14

    .line 335
    .local v2, "a1":I
    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A2:J

    shr-long/2addr v14, v5

    const-wide/16 v16, 0xff

    and-long v14, v14, v16

    long-to-int v3, v14

    .line 336
    .local v3, "a2":I
    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A3:J

    shr-long/2addr v14, v5

    const-wide/16 v16, 0xff

    and-long v14, v14, v16

    long-to-int v4, v14

    .line 341
    .local v4, "a3":I
    if-eqz v1, :cond_e0

    sget-object v14, Lorg/spongycastle/crypto/engines/RijndaelEngine;->logtable:[B

    and-int/lit16 v15, v1, 0xff

    aget-byte v14, v14, v15

    and-int/lit16 v1, v14, 0xff

    .line 342
    :goto_3e
    if-eqz v2, :cond_e3

    sget-object v14, Lorg/spongycastle/crypto/engines/RijndaelEngine;->logtable:[B

    and-int/lit16 v15, v2, 0xff

    aget-byte v14, v14, v15

    and-int/lit16 v2, v14, 0xff

    .line 343
    :goto_48
    if-eqz v3, :cond_e6

    sget-object v14, Lorg/spongycastle/crypto/engines/RijndaelEngine;->logtable:[B

    and-int/lit16 v15, v3, 0xff

    aget-byte v14, v14, v15

    and-int/lit16 v3, v14, 0xff

    .line 344
    :goto_52
    if-eqz v4, :cond_e9

    sget-object v14, Lorg/spongycastle/crypto/engines/RijndaelEngine;->logtable:[B

    and-int/lit16 v15, v4, 0xff

    aget-byte v14, v14, v15

    and-int/lit16 v4, v14, 0xff

    .line 346
    :goto_5c
    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->mul0xe(I)B

    move-result v14

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->mul0xb(I)B

    move-result v15

    xor-int/2addr v14, v15

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->mul0xd(I)B

    move-result v15

    xor-int/2addr v14, v15

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->mul0x9(I)B

    move-result v15

    xor-int/2addr v14, v15

    and-int/lit16 v14, v14, 0xff

    int-to-long v14, v14

    shl-long/2addr v14, v5

    or-long/2addr v6, v14

    .line 348
    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->mul0xe(I)B

    move-result v14

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->mul0xb(I)B

    move-result v15

    xor-int/2addr v14, v15

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->mul0xd(I)B

    move-result v15

    xor-int/2addr v14, v15

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->mul0x9(I)B

    move-result v15

    xor-int/2addr v14, v15

    and-int/lit16 v14, v14, 0xff

    int-to-long v14, v14

    shl-long/2addr v14, v5

    or-long/2addr v8, v14

    .line 350
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->mul0xe(I)B

    move-result v14

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->mul0xb(I)B

    move-result v15

    xor-int/2addr v14, v15

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->mul0xd(I)B

    move-result v15

    xor-int/2addr v14, v15

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->mul0x9(I)B

    move-result v15

    xor-int/2addr v14, v15

    and-int/lit16 v14, v14, 0xff

    int-to-long v14, v14

    shl-long/2addr v14, v5

    or-long/2addr v10, v14

    .line 352
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->mul0xe(I)B

    move-result v14

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->mul0xb(I)B

    move-result v15

    xor-int/2addr v14, v15

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->mul0xd(I)B

    move-result v15

    xor-int/2addr v14, v15

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->mul0x9(I)B

    move-result v15

    xor-int/2addr v14, v15

    and-int/lit16 v14, v14, 0xff

    int-to-long v14, v14

    shl-long/2addr v14, v5

    or-long/2addr v12, v14

    .line 331
    add-int/lit8 v5, v5, 0x8

    goto/16 :goto_6

    .line 341
    :cond_e0
    const/4 v1, -0x1

    goto/16 :goto_3e

    .line 342
    :cond_e3
    const/4 v2, -0x1

    goto/16 :goto_48

    .line 343
    :cond_e6
    const/4 v3, -0x1

    goto/16 :goto_52

    .line 344
    :cond_e9
    const/4 v4, -0x1

    goto/16 :goto_5c

    .line 355
    .end local v1    # "a0":I
    .end local v2    # "a1":I
    .end local v3    # "a2":I
    .end local v4    # "a3":I
    :cond_ec
    move-object/from16 v0, p0

    iput-wide v6, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A0:J

    .line 356
    move-object/from16 v0, p0

    iput-wide v8, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A1:J

    .line 357
    move-object/from16 v0, p0

    iput-wide v10, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A2:J

    .line 358
    move-object/from16 v0, p0

    iput-wide v12, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A3:J

    .line 359
    return-void
.end method

.method private KeyAddition([J)V
    .registers 6
    .param p1, "rk"    # [J

    .prologue
    .line 239
    iget-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A0:J

    const/4 v2, 0x0

    aget-wide v2, p1, v2

    xor-long/2addr v0, v2

    iput-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A0:J

    .line 240
    iget-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A1:J

    const/4 v2, 0x1

    aget-wide v2, p1, v2

    xor-long/2addr v0, v2

    iput-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A1:J

    .line 241
    iget-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A2:J

    const/4 v2, 0x2

    aget-wide v2, p1, v2

    xor-long/2addr v0, v2

    iput-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A2:J

    .line 242
    iget-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A3:J

    const/4 v2, 0x3

    aget-wide v2, p1, v2

    xor-long/2addr v0, v2

    iput-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A3:J

    .line 243
    return-void
.end method

.method private MixColumn()V
    .registers 19

    .prologue
    .line 298
    const-wide/16 v12, 0x0

    .local v12, "r3":J
    move-wide v10, v12

    .local v10, "r2":J
    move-wide v8, v12

    .local v8, "r1":J
    move-wide v6, v12

    .line 300
    .local v6, "r0":J
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_6
    move-object/from16 v0, p0

    iget v14, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC:I

    if-ge v5, v14, :cond_87

    .line 302
    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A0:J

    shr-long/2addr v14, v5

    const-wide/16 v16, 0xff

    and-long v14, v14, v16

    long-to-int v1, v14

    .line 303
    .local v1, "a0":I
    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A1:J

    shr-long/2addr v14, v5

    const-wide/16 v16, 0xff

    and-long v14, v14, v16

    long-to-int v2, v14

    .line 304
    .local v2, "a1":I
    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A2:J

    shr-long/2addr v14, v5

    const-wide/16 v16, 0xff

    and-long v14, v14, v16

    long-to-int v3, v14

    .line 305
    .local v3, "a2":I
    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A3:J

    shr-long/2addr v14, v5

    const-wide/16 v16, 0xff

    and-long v14, v14, v16

    long-to-int v4, v14

    .line 307
    .local v4, "a3":I
    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->mul0x2(I)B

    move-result v14

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->mul0x3(I)B

    move-result v15

    xor-int/2addr v14, v15

    xor-int/2addr v14, v3

    xor-int/2addr v14, v4

    and-int/lit16 v14, v14, 0xff

    int-to-long v14, v14

    shl-long/2addr v14, v5

    or-long/2addr v6, v14

    .line 309
    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->mul0x2(I)B

    move-result v14

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->mul0x3(I)B

    move-result v15

    xor-int/2addr v14, v15

    xor-int/2addr v14, v4

    xor-int/2addr v14, v1

    and-int/lit16 v14, v14, 0xff

    int-to-long v14, v14

    shl-long/2addr v14, v5

    or-long/2addr v8, v14

    .line 311
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->mul0x2(I)B

    move-result v14

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->mul0x3(I)B

    move-result v15

    xor-int/2addr v14, v15

    xor-int/2addr v14, v1

    xor-int/2addr v14, v2

    and-int/lit16 v14, v14, 0xff

    int-to-long v14, v14

    shl-long/2addr v14, v5

    or-long/2addr v10, v14

    .line 313
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->mul0x2(I)B

    move-result v14

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->mul0x3(I)B

    move-result v15

    xor-int/2addr v14, v15

    xor-int/2addr v14, v2

    xor-int/2addr v14, v3

    and-int/lit16 v14, v14, 0xff

    int-to-long v14, v14

    shl-long/2addr v14, v5

    or-long/2addr v12, v14

    .line 300
    add-int/lit8 v5, v5, 0x8

    goto :goto_6

    .line 316
    .end local v1    # "a0":I
    .end local v2    # "a1":I
    .end local v3    # "a2":I
    .end local v4    # "a3":I
    :cond_87
    move-object/from16 v0, p0

    iput-wide v6, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A0:J

    .line 317
    move-object/from16 v0, p0

    iput-wide v8, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A1:J

    .line 318
    move-object/from16 v0, p0

    iput-wide v10, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A2:J

    .line 319
    move-object/from16 v0, p0

    iput-wide v12, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A3:J

    .line 320
    return-void
.end method

.method private ShiftRow([B)V
    .registers 5
    .param p1, "shiftsSC"    # [B

    .prologue
    .line 259
    iget-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A1:J

    const/4 v2, 0x1

    aget-byte v2, p1, v2

    invoke-direct {p0, v0, v1, v2}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shift(JI)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A1:J

    .line 260
    iget-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A2:J

    const/4 v2, 0x2

    aget-byte v2, p1, v2

    invoke-direct {p0, v0, v1, v2}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shift(JI)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A2:J

    .line 261
    iget-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A3:J

    const/4 v2, 0x3

    aget-byte v2, p1, v2

    invoke-direct {p0, v0, v1, v2}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shift(JI)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A3:J

    .line 262
    return-void
.end method

.method private Substitution([B)V
    .registers 4
    .param p1, "box"    # [B

    .prologue
    .line 285
    iget-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A0:J

    invoke-direct {p0, v0, v1, p1}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->applyS(J[B)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A0:J

    .line 286
    iget-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A1:J

    invoke-direct {p0, v0, v1, p1}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->applyS(J[B)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A1:J

    .line 287
    iget-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A2:J

    invoke-direct {p0, v0, v1, p1}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->applyS(J[B)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A2:J

    .line 288
    iget-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A3:J

    invoke-direct {p0, v0, v1, p1}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->applyS(J[B)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A3:J

    .line 289
    return-void
.end method

.method private applyS(J[B)J
    .registers 11
    .param p1, "r"    # J
    .param p3, "box"    # [B

    .prologue
    .line 268
    const-wide/16 v1, 0x0

    .line 270
    .local v1, "res":J
    const/4 v0, 0x0

    .local v0, "j":I
    :goto_3
    iget v3, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC:I

    if-ge v0, v3, :cond_17

    .line 272
    shr-long v3, p1, v0

    const-wide/16 v5, 0xff

    and-long/2addr v3, v5

    long-to-int v3, v3

    aget-byte v3, p3, v3

    and-int/lit16 v3, v3, 0xff

    int-to-long v3, v3

    shl-long/2addr v3, v0

    or-long/2addr v1, v3

    .line 270
    add-int/lit8 v0, v0, 0x8

    goto :goto_3

    .line 275
    :cond_17
    return-wide v1
.end method

.method private decryptBlock([[J)V
    .registers 4
    .param p1, "rk"    # [[J

    .prologue
    .line 705
    iget v1, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->ROUNDS:I

    aget-object v1, p1, v1

    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->KeyAddition([J)V

    .line 706
    sget-object v1, Lorg/spongycastle/crypto/engines/RijndaelEngine;->Si:[B

    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->Substitution([B)V

    .line 707
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shifts1SC:[B

    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->ShiftRow([B)V

    .line 712
    iget v1, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->ROUNDS:I

    add-int/lit8 v0, v1, -0x1

    .local v0, "r":I
    :goto_15
    if-lez v0, :cond_2c

    .line 714
    aget-object v1, p1, v0

    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->KeyAddition([J)V

    .line 715
    invoke-direct {p0}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->InvMixColumn()V

    .line 716
    sget-object v1, Lorg/spongycastle/crypto/engines/RijndaelEngine;->Si:[B

    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->Substitution([B)V

    .line 717
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shifts1SC:[B

    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->ShiftRow([B)V

    .line 712
    add-int/lit8 v0, v0, -0x1

    goto :goto_15

    .line 723
    :cond_2c
    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->KeyAddition([J)V

    .line 724
    return-void
.end method

.method private encryptBlock([[J)V
    .registers 4
    .param p1, "rk"    # [[J

    .prologue
    .line 667
    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->KeyAddition([J)V

    .line 672
    const/4 v0, 0x1

    .local v0, "r":I
    :goto_7
    iget v1, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->ROUNDS:I

    if-ge v0, v1, :cond_20

    .line 674
    sget-object v1, Lorg/spongycastle/crypto/engines/RijndaelEngine;->S:[B

    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->Substitution([B)V

    .line 675
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shifts0SC:[B

    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->ShiftRow([B)V

    .line 676
    invoke-direct {p0}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->MixColumn()V

    .line 677
    aget-object v1, p1, v0

    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->KeyAddition([J)V

    .line 672
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 683
    :cond_20
    sget-object v1, Lorg/spongycastle/crypto/engines/RijndaelEngine;->S:[B

    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->Substitution([B)V

    .line 684
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->shifts0SC:[B

    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->ShiftRow([B)V

    .line 685
    iget v1, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->ROUNDS:I

    aget-object v1, p1, v1

    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->KeyAddition([J)V

    .line 686
    return-void
.end method

.method private generateWorkingKey([B)[[J
    .registers 21
    .param p1, "key"    # [B

    .prologue
    .line 369
    const/4 v8, 0x0

    .line 370
    .local v8, "rconpointer":I
    move-object/from16 v0, p1

    array-length v12, v0

    mul-int/lit8 v7, v12, 0x8

    .line 371
    .local v7, "keyBits":I
    const/4 v12, 0x4

    const/16 v13, 0x40

    filled-new-array {v12, v13}, [I

    move-result-object v12

    sget-object v13, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-static {v13, v12}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [[B

    .line 372
    .local v11, "tk":[[B
    const/16 v12, 0xf

    const/4 v13, 0x4

    filled-new-array {v12, v13}, [I

    move-result-object v12

    sget-object v13, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-static {v13, v12}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[J

    .line 374
    .local v2, "W":[[J
    sparse-switch v7, :sswitch_data_1a4

    .line 392
    new-instance v12, Ljava/lang/IllegalArgumentException;

    const-string v13, "Key length not 128/160/192/224/256 bits."

    invoke-direct {v12, v13}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 377
    :sswitch_2f
    const/4 v1, 0x4

    .line 395
    .local v1, "KC":I
    :goto_30
    move-object/from16 v0, p0

    iget v12, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->blockBits:I

    if-lt v7, v12, :cond_5c

    .line 397
    add-int/lit8 v12, v1, 0x6

    move-object/from16 v0, p0

    iput v12, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->ROUNDS:I

    .line 407
    :goto_3c
    const/4 v4, 0x0

    .line 409
    .local v4, "index":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_3e
    move-object/from16 v0, p1

    array-length v12, v0

    if-ge v3, v12, :cond_69

    .line 411
    rem-int/lit8 v12, v3, 0x4

    aget-object v12, v11, v12

    div-int/lit8 v13, v3, 0x4

    add-int/lit8 v5, v4, 0x1

    .end local v4    # "index":I
    .local v5, "index":I
    aget-byte v14, p1, v4

    aput-byte v14, v12, v13

    .line 409
    add-int/lit8 v3, v3, 0x1

    move v4, v5

    .end local v5    # "index":I
    .restart local v4    # "index":I
    goto :goto_3e

    .line 380
    .end local v1    # "KC":I
    .end local v3    # "i":I
    .end local v4    # "index":I
    :sswitch_53
    const/4 v1, 0x5

    .line 381
    .restart local v1    # "KC":I
    goto :goto_30

    .line 383
    .end local v1    # "KC":I
    :sswitch_55
    const/4 v1, 0x6

    .line 384
    .restart local v1    # "KC":I
    goto :goto_30

    .line 386
    .end local v1    # "KC":I
    :sswitch_57
    const/4 v1, 0x7

    .line 387
    .restart local v1    # "KC":I
    goto :goto_30

    .line 389
    .end local v1    # "KC":I
    :sswitch_59
    const/16 v1, 0x8

    .line 390
    .restart local v1    # "KC":I
    goto :goto_30

    .line 401
    :cond_5c
    move-object/from16 v0, p0

    iget v12, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC:I

    div-int/lit8 v12, v12, 0x8

    add-int/lit8 v12, v12, 0x6

    move-object/from16 v0, p0

    iput v12, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->ROUNDS:I

    goto :goto_3c

    .line 414
    .restart local v3    # "i":I
    .restart local v4    # "index":I
    :cond_69
    const/4 v10, 0x0

    .line 419
    .local v10, "t":I
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_6b
    if-ge v6, v1, :cond_ab

    move-object/from16 v0, p0

    iget v12, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->ROUNDS:I

    add-int/lit8 v12, v12, 0x1

    move-object/from16 v0, p0

    iget v13, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC:I

    div-int/lit8 v13, v13, 0x8

    mul-int/2addr v12, v13

    if-ge v10, v12, :cond_ab

    .line 421
    const/4 v3, 0x0

    :goto_7d
    const/4 v12, 0x4

    if-ge v3, v12, :cond_a5

    .line 423
    move-object/from16 v0, p0

    iget v12, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC:I

    div-int/lit8 v12, v12, 0x8

    div-int v12, v10, v12

    aget-object v12, v2, v12

    aget-wide v13, v12, v3

    aget-object v15, v11, v3

    aget-byte v15, v15, v6

    and-int/lit16 v15, v15, 0xff

    int-to-long v15, v15

    mul-int/lit8 v17, v10, 0x8

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC:I

    move/from16 v18, v0

    rem-int v17, v17, v18

    shl-long v15, v15, v17

    or-long/2addr v13, v15

    aput-wide v13, v12, v3

    .line 421
    add-int/lit8 v3, v3, 0x1

    goto :goto_7d

    .line 419
    :cond_a5
    add-int/lit8 v6, v6, 0x1

    add-int/lit8 v10, v10, 0x1

    goto :goto_6b

    .end local v8    # "rconpointer":I
    .local v9, "rconpointer":I
    :cond_aa
    move v8, v9

    .line 431
    .end local v9    # "rconpointer":I
    .restart local v8    # "rconpointer":I
    :cond_ab
    move-object/from16 v0, p0

    iget v12, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->ROUNDS:I

    add-int/lit8 v12, v12, 0x1

    move-object/from16 v0, p0

    iget v13, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC:I

    div-int/lit8 v13, v13, 0x8

    mul-int/2addr v12, v13

    if-ge v10, v12, :cond_1a3

    .line 433
    const/4 v3, 0x0

    :goto_bb
    const/4 v12, 0x4

    if-ge v3, v12, :cond_de

    .line 435
    aget-object v12, v11, v3

    const/4 v13, 0x0

    aget-byte v14, v12, v13

    sget-object v15, Lorg/spongycastle/crypto/engines/RijndaelEngine;->S:[B

    add-int/lit8 v16, v3, 0x1

    rem-int/lit8 v16, v16, 0x4

    aget-object v16, v11, v16

    add-int/lit8 v17, v1, -0x1

    aget-byte v16, v16, v17

    move/from16 v0, v16

    and-int/lit16 v0, v0, 0xff

    move/from16 v16, v0

    aget-byte v15, v15, v16

    xor-int/2addr v14, v15

    int-to-byte v14, v14

    aput-byte v14, v12, v13

    .line 433
    add-int/lit8 v3, v3, 0x1

    goto :goto_bb

    .line 437
    :cond_de
    const/4 v12, 0x0

    aget-object v12, v11, v12

    const/4 v13, 0x0

    aget-byte v14, v12, v13

    sget-object v15, Lorg/spongycastle/crypto/engines/RijndaelEngine;->rcon:[I

    add-int/lit8 v9, v8, 0x1

    .end local v8    # "rconpointer":I
    .restart local v9    # "rconpointer":I
    aget v15, v15, v8

    xor-int/2addr v14, v15

    int-to-byte v14, v14

    aput-byte v14, v12, v13

    .line 439
    const/4 v12, 0x6

    if-gt v1, v12, :cond_10c

    .line 441
    const/4 v6, 0x1

    :goto_f2
    if-ge v6, v1, :cond_163

    .line 443
    const/4 v3, 0x0

    :goto_f5
    const/4 v12, 0x4

    if-ge v3, v12, :cond_109

    .line 445
    aget-object v12, v11, v3

    aget-byte v13, v12, v6

    aget-object v14, v11, v3

    add-int/lit8 v15, v6, -0x1

    aget-byte v14, v14, v15

    xor-int/2addr v13, v14

    int-to-byte v13, v13

    aput-byte v13, v12, v6

    .line 443
    add-int/lit8 v3, v3, 0x1

    goto :goto_f5

    .line 441
    :cond_109
    add-int/lit8 v6, v6, 0x1

    goto :goto_f2

    .line 451
    :cond_10c
    const/4 v6, 0x1

    :goto_10d
    const/4 v12, 0x4

    if-ge v6, v12, :cond_128

    .line 453
    const/4 v3, 0x0

    :goto_111
    const/4 v12, 0x4

    if-ge v3, v12, :cond_125

    .line 455
    aget-object v12, v11, v3

    aget-byte v13, v12, v6

    aget-object v14, v11, v3

    add-int/lit8 v15, v6, -0x1

    aget-byte v14, v14, v15

    xor-int/2addr v13, v14

    int-to-byte v13, v13

    aput-byte v13, v12, v6

    .line 453
    add-int/lit8 v3, v3, 0x1

    goto :goto_111

    .line 451
    :cond_125
    add-int/lit8 v6, v6, 0x1

    goto :goto_10d

    .line 458
    :cond_128
    const/4 v3, 0x0

    :goto_129
    const/4 v12, 0x4

    if-ge v3, v12, :cond_148

    .line 460
    aget-object v12, v11, v3

    const/4 v13, 0x4

    aget-byte v14, v12, v13

    sget-object v15, Lorg/spongycastle/crypto/engines/RijndaelEngine;->S:[B

    aget-object v16, v11, v3

    const/16 v17, 0x3

    aget-byte v16, v16, v17

    move/from16 v0, v16

    and-int/lit16 v0, v0, 0xff

    move/from16 v16, v0

    aget-byte v15, v15, v16

    xor-int/2addr v14, v15

    int-to-byte v14, v14

    aput-byte v14, v12, v13

    .line 458
    add-int/lit8 v3, v3, 0x1

    goto :goto_129

    .line 462
    :cond_148
    const/4 v6, 0x5

    :goto_149
    if-ge v6, v1, :cond_163

    .line 464
    const/4 v3, 0x0

    :goto_14c
    const/4 v12, 0x4

    if-ge v3, v12, :cond_160

    .line 466
    aget-object v12, v11, v3

    aget-byte v13, v12, v6

    aget-object v14, v11, v3

    add-int/lit8 v15, v6, -0x1

    aget-byte v14, v14, v15

    xor-int/2addr v13, v14

    int-to-byte v13, v13

    aput-byte v13, v12, v6

    .line 464
    add-int/lit8 v3, v3, 0x1

    goto :goto_14c

    .line 462
    :cond_160
    add-int/lit8 v6, v6, 0x1

    goto :goto_149

    .line 474
    :cond_163
    const/4 v6, 0x0

    :goto_164
    if-ge v6, v1, :cond_aa

    move-object/from16 v0, p0

    iget v12, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->ROUNDS:I

    add-int/lit8 v12, v12, 0x1

    move-object/from16 v0, p0

    iget v13, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC:I

    div-int/lit8 v13, v13, 0x8

    mul-int/2addr v12, v13

    if-ge v10, v12, :cond_aa

    .line 476
    const/4 v3, 0x0

    :goto_176
    const/4 v12, 0x4

    if-ge v3, v12, :cond_19e

    .line 478
    move-object/from16 v0, p0

    iget v12, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC:I

    div-int/lit8 v12, v12, 0x8

    div-int v12, v10, v12

    aget-object v12, v2, v12

    aget-wide v13, v12, v3

    aget-object v15, v11, v3

    aget-byte v15, v15, v6

    and-int/lit16 v15, v15, 0xff

    int-to-long v15, v15

    mul-int/lit8 v17, v10, 0x8

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC:I

    move/from16 v18, v0

    rem-int v17, v17, v18

    shl-long v15, v15, v17

    or-long/2addr v13, v15

    aput-wide v13, v12, v3

    .line 476
    add-int/lit8 v3, v3, 0x1

    goto :goto_176

    .line 474
    :cond_19e
    add-int/lit8 v6, v6, 0x1

    add-int/lit8 v10, v10, 0x1

    goto :goto_164

    .line 483
    .end local v9    # "rconpointer":I
    .restart local v8    # "rconpointer":I
    :cond_1a3
    return-object v2

    .line 374
    :sswitch_data_1a4
    .sparse-switch
        0x80 -> :sswitch_2f
        0xa0 -> :sswitch_53
        0xc0 -> :sswitch_55
        0xe0 -> :sswitch_57
        0x100 -> :sswitch_59
    .end sparse-switch
.end method

.method private mul0x2(I)B
    .registers 4
    .param p1, "b"    # I

    .prologue
    .line 158
    if-eqz p1, :cond_f

    .line 160
    sget-object v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->aLogtable:[B

    sget-object v1, Lorg/spongycastle/crypto/engines/RijndaelEngine;->logtable:[B

    aget-byte v1, v1, p1

    and-int/lit16 v1, v1, 0xff

    add-int/lit8 v1, v1, 0x19

    aget-byte v0, v0, v1

    .line 164
    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method private mul0x3(I)B
    .registers 4
    .param p1, "b"    # I

    .prologue
    .line 171
    if-eqz p1, :cond_f

    .line 173
    sget-object v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->aLogtable:[B

    sget-object v1, Lorg/spongycastle/crypto/engines/RijndaelEngine;->logtable:[B

    aget-byte v1, v1, p1

    and-int/lit16 v1, v1, 0xff

    add-int/lit8 v1, v1, 0x1

    aget-byte v0, v0, v1

    .line 177
    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method private mul0x9(I)B
    .registers 4
    .param p1, "b"    # I

    .prologue
    .line 184
    if-ltz p1, :cond_9

    .line 186
    sget-object v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->aLogtable:[B

    add-int/lit16 v1, p1, 0xc7

    aget-byte v0, v0, v1

    .line 190
    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method private mul0xb(I)B
    .registers 4
    .param p1, "b"    # I

    .prologue
    .line 197
    if-ltz p1, :cond_9

    .line 199
    sget-object v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->aLogtable:[B

    add-int/lit8 v1, p1, 0x68

    aget-byte v0, v0, v1

    .line 203
    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method private mul0xd(I)B
    .registers 4
    .param p1, "b"    # I

    .prologue
    .line 210
    if-ltz p1, :cond_9

    .line 212
    sget-object v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->aLogtable:[B

    add-int/lit16 v1, p1, 0xee

    aget-byte v0, v0, v1

    .line 216
    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method private mul0xe(I)B
    .registers 4
    .param p1, "b"    # I

    .prologue
    .line 223
    if-ltz p1, :cond_9

    .line 225
    sget-object v0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->aLogtable:[B

    add-int/lit16 v1, p1, 0xdf

    aget-byte v0, v0, v1

    .line 229
    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method private packBlock([BI)V
    .registers 8
    .param p1, "bytes"    # [B
    .param p2, "off"    # I

    .prologue
    .line 648
    move v0, p2

    .line 650
    .local v0, "index":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_2
    iget v3, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC:I

    if-eq v2, v3, :cond_2d

    .line 652
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "index":I
    .local v1, "index":I
    iget-wide v3, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A0:J

    shr-long/2addr v3, v2

    long-to-int v3, v3

    int-to-byte v3, v3

    aput-byte v3, p1, v0

    .line 653
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "index":I
    .restart local v0    # "index":I
    iget-wide v3, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A1:J

    shr-long/2addr v3, v2

    long-to-int v3, v3

    int-to-byte v3, v3

    aput-byte v3, p1, v1

    .line 654
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "index":I
    .restart local v1    # "index":I
    iget-wide v3, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A2:J

    shr-long/2addr v3, v2

    long-to-int v3, v3

    int-to-byte v3, v3

    aput-byte v3, p1, v0

    .line 655
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "index":I
    .restart local v0    # "index":I
    iget-wide v3, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A3:J

    shr-long/2addr v3, v2

    long-to-int v3, v3

    int-to-byte v3, v3

    aput-byte v3, p1, v1

    .line 650
    add-int/lit8 v2, v2, 0x8

    goto :goto_2

    .line 657
    :cond_2d
    return-void
.end method

.method private shift(JI)J
    .registers 8
    .param p1, "r"    # J
    .param p3, "shift"    # I

    .prologue
    .line 249
    ushr-long v0, p1, p3

    iget v2, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC:I

    sub-int/2addr v2, p3

    shl-long v2, p1, v2

    or-long/2addr v0, v2

    iget-wide v2, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC_MASK:J

    and-long/2addr v0, v2

    return-wide v0
.end method

.method private unpackBlock([BI)V
    .registers 10
    .param p1, "bytes"    # [B
    .param p2, "off"    # I

    .prologue
    .line 628
    move v0, p2

    .line 630
    .local v0, "index":I
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "index":I
    .local v1, "index":I
    aget-byte v3, p1, v0

    and-int/lit16 v3, v3, 0xff

    int-to-long v3, v3

    iput-wide v3, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A0:J

    .line 631
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "index":I
    .restart local v0    # "index":I
    aget-byte v3, p1, v1

    and-int/lit16 v3, v3, 0xff

    int-to-long v3, v3

    iput-wide v3, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A1:J

    .line 632
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "index":I
    .restart local v1    # "index":I
    aget-byte v3, p1, v0

    and-int/lit16 v3, v3, 0xff

    int-to-long v3, v3

    iput-wide v3, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A2:J

    .line 633
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "index":I
    .restart local v0    # "index":I
    aget-byte v3, p1, v1

    and-int/lit16 v3, v3, 0xff

    int-to-long v3, v3

    iput-wide v3, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A3:J

    .line 635
    const/16 v2, 0x8

    .local v2, "j":I
    :goto_27
    iget v3, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC:I

    if-eq v2, v3, :cond_62

    .line 637
    iget-wide v3, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A0:J

    add-int/lit8 v1, v0, 0x1

    .end local v0    # "index":I
    .restart local v1    # "index":I
    aget-byte v5, p1, v0

    and-int/lit16 v5, v5, 0xff

    int-to-long v5, v5

    shl-long/2addr v5, v2

    or-long/2addr v3, v5

    iput-wide v3, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A0:J

    .line 638
    iget-wide v3, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A1:J

    add-int/lit8 v0, v1, 0x1

    .end local v1    # "index":I
    .restart local v0    # "index":I
    aget-byte v5, p1, v1

    and-int/lit16 v5, v5, 0xff

    int-to-long v5, v5

    shl-long/2addr v5, v2

    or-long/2addr v3, v5

    iput-wide v3, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A1:J

    .line 639
    iget-wide v3, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A2:J

    add-int/lit8 v1, v0, 0x1

    .end local v0    # "index":I
    .restart local v1    # "index":I
    aget-byte v5, p1, v0

    and-int/lit16 v5, v5, 0xff

    int-to-long v5, v5

    shl-long/2addr v5, v2

    or-long/2addr v3, v5

    iput-wide v3, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A2:J

    .line 640
    iget-wide v3, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A3:J

    add-int/lit8 v0, v1, 0x1

    .end local v1    # "index":I
    .restart local v0    # "index":I
    aget-byte v5, p1, v1

    and-int/lit16 v5, v5, 0xff

    int-to-long v5, v5

    shl-long/2addr v5, v2

    or-long/2addr v3, v5

    iput-wide v3, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->A3:J

    .line 635
    add-int/lit8 v2, v2, 0x8

    goto :goto_27

    .line 642
    :cond_62
    return-void
.end method


# virtual methods
.method public getAlgorithmName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 575
    const-string v0, "Rijndael"

    return-object v0
.end method

.method public getBlockSize()I
    .registers 2

    .prologue
    .line 580
    iget v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC:I

    div-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .registers 6
    .param p1, "forEncryption"    # Z
    .param p2, "params"    # Lorg/spongycastle/crypto/CipherParameters;

    .prologue
    .line 563
    instance-of v0, p2, Lorg/spongycastle/crypto/params/KeyParameter;

    if-eqz v0, :cond_13

    .line 565
    check-cast p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .end local p2    # "params":Lorg/spongycastle/crypto/CipherParameters;
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->generateWorkingKey([B)[[J

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->workingKey:[[J

    .line 566
    iput-boolean p1, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->forEncryption:Z

    .line 567
    return-void

    .line 570
    .restart local p2    # "params":Lorg/spongycastle/crypto/CipherParameters;
    :cond_13
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid parameter passed to Rijndael init - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public processBlock([BI[BI)I
    .registers 7
    .param p1, "in"    # [B
    .param p2, "inOff"    # I
    .param p3, "out"    # [B
    .param p4, "outOff"    # I

    .prologue
    .line 589
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->workingKey:[[J

    if-nez v0, :cond_c

    .line 591
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Rijndael engine not initialised"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 594
    :cond_c
    iget v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC:I

    div-int/lit8 v0, v0, 0x2

    add-int/2addr v0, p2

    array-length v1, p1

    if-le v0, v1, :cond_1c

    .line 596
    new-instance v0, Lorg/spongycastle/crypto/DataLengthException;

    const-string v1, "input buffer too short"

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/DataLengthException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 599
    :cond_1c
    iget v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC:I

    div-int/lit8 v0, v0, 0x2

    add-int/2addr v0, p4

    array-length v1, p3

    if-le v0, v1, :cond_2c

    .line 601
    new-instance v0, Lorg/spongycastle/crypto/OutputLengthException;

    const-string v1, "output buffer too short"

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/OutputLengthException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 604
    :cond_2c
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->forEncryption:Z

    if-eqz v0, :cond_40

    .line 606
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->unpackBlock([BI)V

    .line 607
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->workingKey:[[J

    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->encryptBlock([[J)V

    .line 608
    invoke-direct {p0, p3, p4}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->packBlock([BI)V

    .line 617
    :goto_3b
    iget v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->BC:I

    div-int/lit8 v0, v0, 0x2

    return v0

    .line 612
    :cond_40
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->unpackBlock([BI)V

    .line 613
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/RijndaelEngine;->workingKey:[[J

    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->decryptBlock([[J)V

    .line 614
    invoke-direct {p0, p3, p4}, Lorg/spongycastle/crypto/engines/RijndaelEngine;->packBlock([BI)V

    goto :goto_3b
.end method

.method public reset()V
    .registers 1

    .prologue
    .line 622
    return-void
.end method
