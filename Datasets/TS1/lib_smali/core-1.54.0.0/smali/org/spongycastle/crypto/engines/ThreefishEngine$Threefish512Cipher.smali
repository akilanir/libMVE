.class final Lorg/spongycastle/crypto/engines/ThreefishEngine$Threefish512Cipher;
.super Lorg/spongycastle/crypto/engines/ThreefishEngine$ThreefishCipher;
.source "ThreefishEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/crypto/engines/ThreefishEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Threefish512Cipher"
.end annotation


# static fields
.field private static final ROTATION_0_0:I = 0x2e

.field private static final ROTATION_0_1:I = 0x24

.field private static final ROTATION_0_2:I = 0x13

.field private static final ROTATION_0_3:I = 0x25

.field private static final ROTATION_1_0:I = 0x21

.field private static final ROTATION_1_1:I = 0x1b

.field private static final ROTATION_1_2:I = 0xe

.field private static final ROTATION_1_3:I = 0x2a

.field private static final ROTATION_2_0:I = 0x11

.field private static final ROTATION_2_1:I = 0x31

.field private static final ROTATION_2_2:I = 0x24

.field private static final ROTATION_2_3:I = 0x27

.field private static final ROTATION_3_0:I = 0x2c

.field private static final ROTATION_3_1:I = 0x9

.field private static final ROTATION_3_2:I = 0x36

.field private static final ROTATION_3_3:I = 0x38

.field private static final ROTATION_4_0:I = 0x27

.field private static final ROTATION_4_1:I = 0x1e

.field private static final ROTATION_4_2:I = 0x22

.field private static final ROTATION_4_3:I = 0x18

.field private static final ROTATION_5_0:I = 0xd

.field private static final ROTATION_5_1:I = 0x32

.field private static final ROTATION_5_2:I = 0xa

.field private static final ROTATION_5_3:I = 0x11

.field private static final ROTATION_6_0:I = 0x19

.field private static final ROTATION_6_1:I = 0x1d

.field private static final ROTATION_6_2:I = 0x27

.field private static final ROTATION_6_3:I = 0x2b

.field private static final ROTATION_7_0:I = 0x8

.field private static final ROTATION_7_1:I = 0x23

.field private static final ROTATION_7_2:I = 0x38

.field private static final ROTATION_7_3:I = 0x16


# direct methods
.method protected constructor <init>([J[J)V
    .registers 3
    .param p1, "kw"    # [J
    .param p2, "t"    # [J

    .prologue
    .line 691
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/engines/ThreefishEngine$ThreefishCipher;-><init>([J[J)V

    .line 692
    return-void
.end method


# virtual methods
.method public decryptBlock([J[J)V
    .registers 35
    .param p1, "block"    # [J
    .param p2, "state"    # [J

    .prologue
    .line 840
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/engines/ThreefishEngine$Threefish512Cipher;->kw:[J

    move-object/from16 v24, v0

    .line 841
    .local v24, "kw":[J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/engines/ThreefishEngine$Threefish512Cipher;->t:[J

    move-object/from16 v27, v0

    .line 842
    .local v27, "t":[J
    # getter for: Lorg/spongycastle/crypto/engines/ThreefishEngine;->MOD9:[I
    invoke-static {}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->access$200()[I

    move-result-object v26

    .line 843
    .local v26, "mod9":[I
    # getter for: Lorg/spongycastle/crypto/engines/ThreefishEngine;->MOD3:[I
    invoke-static {}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->access$100()[I

    move-result-object v25

    .line 846
    .local v25, "mod3":[I
    move-object/from16 v0, v24

    array-length v0, v0

    move/from16 v28, v0

    const/16 v29, 0x11

    move/from16 v0, v28

    move/from16 v1, v29

    if-eq v0, v1, :cond_27

    .line 848
    new-instance v28, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v28 .. v28}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v28

    .line 850
    :cond_27
    move-object/from16 v0, v27

    array-length v0, v0

    move/from16 v28, v0

    const/16 v29, 0x5

    move/from16 v0, v28

    move/from16 v1, v29

    if-eq v0, v1, :cond_3a

    .line 852
    new-instance v28, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v28 .. v28}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v28

    .line 855
    :cond_3a
    const/16 v28, 0x0

    aget-wide v5, p1, v28

    .line 856
    .local v5, "b0":J
    const/16 v28, 0x1

    aget-wide v7, p1, v28

    .line 857
    .local v7, "b1":J
    const/16 v28, 0x2

    aget-wide v9, p1, v28

    .line 858
    .local v9, "b2":J
    const/16 v28, 0x3

    aget-wide v11, p1, v28

    .line 859
    .local v11, "b3":J
    const/16 v28, 0x4

    aget-wide v13, p1, v28

    .line 860
    .local v13, "b4":J
    const/16 v28, 0x5

    aget-wide v15, p1, v28

    .line 861
    .local v15, "b5":J
    const/16 v28, 0x6

    aget-wide v17, p1, v28

    .line 862
    .local v17, "b6":J
    const/16 v28, 0x7

    aget-wide v19, p1, v28

    .line 864
    .local v19, "b7":J
    const/16 v21, 0x11

    .local v21, "d":I
    :goto_5c
    const/16 v28, 0x1

    move/from16 v0, v21

    move/from16 v1, v28

    if-lt v0, v1, :cond_248

    .line 866
    aget v23, v26, v21

    .line 867
    .local v23, "dm9":I
    aget v22, v25, v21

    .line 870
    .local v22, "dm3":I
    add-int/lit8 v28, v23, 0x1

    aget-wide v28, v24, v28

    sub-long v5, v5, v28

    .line 871
    add-int/lit8 v28, v23, 0x2

    aget-wide v28, v24, v28

    sub-long v7, v7, v28

    .line 872
    add-int/lit8 v28, v23, 0x3

    aget-wide v28, v24, v28

    sub-long v9, v9, v28

    .line 873
    add-int/lit8 v28, v23, 0x4

    aget-wide v28, v24, v28

    sub-long v11, v11, v28

    .line 874
    add-int/lit8 v28, v23, 0x5

    aget-wide v28, v24, v28

    sub-long v13, v13, v28

    .line 875
    add-int/lit8 v28, v23, 0x6

    aget-wide v28, v24, v28

    add-int/lit8 v30, v22, 0x1

    aget-wide v30, v27, v30

    add-long v28, v28, v30

    sub-long v15, v15, v28

    .line 876
    add-int/lit8 v28, v23, 0x7

    aget-wide v28, v24, v28

    add-int/lit8 v30, v22, 0x2

    aget-wide v30, v27, v30

    add-long v28, v28, v30

    sub-long v17, v17, v28

    .line 877
    add-int/lit8 v28, v23, 0x8

    aget-wide v28, v24, v28

    move/from16 v0, v21

    int-to-long v0, v0

    move-wide/from16 v30, v0

    add-long v28, v28, v30

    const-wide/16 v30, 0x1

    add-long v28, v28, v30

    sub-long v19, v19, v28

    .line 881
    const/16 v28, 0x8

    move/from16 v0, v28

    move-wide/from16 v1, v17

    invoke-static {v7, v8, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v7

    .line 882
    sub-long v17, v17, v7

    .line 883
    const/16 v28, 0x23

    move-wide/from16 v0, v19

    move/from16 v2, v28

    invoke-static {v0, v1, v2, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v19

    .line 884
    sub-long v5, v5, v19

    .line 885
    const/16 v28, 0x38

    move-wide v0, v15

    move/from16 v2, v28

    invoke-static {v0, v1, v2, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v15

    .line 886
    sub-long/2addr v9, v15

    .line 887
    const/16 v28, 0x16

    move/from16 v0, v28

    invoke-static {v11, v12, v0, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v11

    .line 888
    sub-long/2addr v13, v11

    .line 890
    const/16 v28, 0x19

    move/from16 v0, v28

    invoke-static {v7, v8, v0, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v7

    .line 891
    sub-long/2addr v13, v7

    .line 892
    const/16 v28, 0x1d

    move/from16 v0, v28

    move-wide/from16 v1, v17

    invoke-static {v11, v12, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v11

    .line 893
    sub-long v17, v17, v11

    .line 894
    const/16 v28, 0x27

    move-wide v0, v15

    move/from16 v2, v28

    invoke-static {v0, v1, v2, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v15

    .line 895
    sub-long/2addr v5, v15

    .line 896
    const/16 v28, 0x2b

    move-wide/from16 v0, v19

    move/from16 v2, v28

    invoke-static {v0, v1, v2, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v19

    .line 897
    sub-long v9, v9, v19

    .line 899
    const/16 v28, 0xd

    move/from16 v0, v28

    invoke-static {v7, v8, v0, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v7

    .line 900
    sub-long/2addr v9, v7

    .line 901
    const/16 v28, 0x32

    move-wide/from16 v0, v19

    move/from16 v2, v28

    invoke-static {v0, v1, v2, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v19

    .line 902
    sub-long v13, v13, v19

    .line 903
    const/16 v28, 0xa

    move-wide v0, v15

    move/from16 v2, v28

    move-wide/from16 v3, v17

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v15

    .line 904
    sub-long v17, v17, v15

    .line 905
    const/16 v28, 0x11

    move/from16 v0, v28

    invoke-static {v11, v12, v0, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v11

    .line 906
    sub-long/2addr v5, v11

    .line 908
    const/16 v28, 0x27

    move/from16 v0, v28

    invoke-static {v7, v8, v0, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v7

    .line 909
    sub-long/2addr v5, v7

    .line 910
    const/16 v28, 0x1e

    move/from16 v0, v28

    invoke-static {v11, v12, v0, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v11

    .line 911
    sub-long/2addr v9, v11

    .line 912
    const/16 v28, 0x22

    move-wide v0, v15

    move/from16 v2, v28

    invoke-static {v0, v1, v2, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v15

    .line 913
    sub-long/2addr v13, v15

    .line 914
    const/16 v28, 0x18

    move-wide/from16 v0, v19

    move/from16 v2, v28

    move-wide/from16 v3, v17

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v19

    .line 915
    sub-long v17, v17, v19

    .line 918
    aget-wide v28, v24, v23

    sub-long v5, v5, v28

    .line 919
    add-int/lit8 v28, v23, 0x1

    aget-wide v28, v24, v28

    sub-long v7, v7, v28

    .line 920
    add-int/lit8 v28, v23, 0x2

    aget-wide v28, v24, v28

    sub-long v9, v9, v28

    .line 921
    add-int/lit8 v28, v23, 0x3

    aget-wide v28, v24, v28

    sub-long v11, v11, v28

    .line 922
    add-int/lit8 v28, v23, 0x4

    aget-wide v28, v24, v28

    sub-long v13, v13, v28

    .line 923
    add-int/lit8 v28, v23, 0x5

    aget-wide v28, v24, v28

    aget-wide v30, v27, v22

    add-long v28, v28, v30

    sub-long v15, v15, v28

    .line 924
    add-int/lit8 v28, v23, 0x6

    aget-wide v28, v24, v28

    add-int/lit8 v30, v22, 0x1

    aget-wide v30, v27, v30

    add-long v28, v28, v30

    sub-long v17, v17, v28

    .line 925
    add-int/lit8 v28, v23, 0x7

    aget-wide v28, v24, v28

    move/from16 v0, v21

    int-to-long v0, v0

    move-wide/from16 v30, v0

    add-long v28, v28, v30

    sub-long v19, v19, v28

    .line 928
    const/16 v28, 0x2c

    move/from16 v0, v28

    move-wide/from16 v1, v17

    invoke-static {v7, v8, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v7

    .line 929
    sub-long v17, v17, v7

    .line 930
    const/16 v28, 0x9

    move-wide/from16 v0, v19

    move/from16 v2, v28

    invoke-static {v0, v1, v2, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v19

    .line 931
    sub-long v5, v5, v19

    .line 932
    const/16 v28, 0x36

    move-wide v0, v15

    move/from16 v2, v28

    invoke-static {v0, v1, v2, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v15

    .line 933
    sub-long/2addr v9, v15

    .line 934
    const/16 v28, 0x38

    move/from16 v0, v28

    invoke-static {v11, v12, v0, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v11

    .line 935
    sub-long/2addr v13, v11

    .line 937
    const/16 v28, 0x11

    move/from16 v0, v28

    invoke-static {v7, v8, v0, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v7

    .line 938
    sub-long/2addr v13, v7

    .line 939
    const/16 v28, 0x31

    move/from16 v0, v28

    move-wide/from16 v1, v17

    invoke-static {v11, v12, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v11

    .line 940
    sub-long v17, v17, v11

    .line 941
    const/16 v28, 0x24

    move-wide v0, v15

    move/from16 v2, v28

    invoke-static {v0, v1, v2, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v15

    .line 942
    sub-long/2addr v5, v15

    .line 943
    const/16 v28, 0x27

    move-wide/from16 v0, v19

    move/from16 v2, v28

    invoke-static {v0, v1, v2, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v19

    .line 944
    sub-long v9, v9, v19

    .line 946
    const/16 v28, 0x21

    move/from16 v0, v28

    invoke-static {v7, v8, v0, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v7

    .line 947
    sub-long/2addr v9, v7

    .line 948
    const/16 v28, 0x1b

    move-wide/from16 v0, v19

    move/from16 v2, v28

    invoke-static {v0, v1, v2, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v19

    .line 949
    sub-long v13, v13, v19

    .line 950
    const/16 v28, 0xe

    move-wide v0, v15

    move/from16 v2, v28

    move-wide/from16 v3, v17

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v15

    .line 951
    sub-long v17, v17, v15

    .line 952
    const/16 v28, 0x2a

    move/from16 v0, v28

    invoke-static {v11, v12, v0, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v11

    .line 953
    sub-long/2addr v5, v11

    .line 955
    const/16 v28, 0x2e

    move/from16 v0, v28

    invoke-static {v7, v8, v0, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v7

    .line 956
    sub-long/2addr v5, v7

    .line 957
    const/16 v28, 0x24

    move/from16 v0, v28

    invoke-static {v11, v12, v0, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v11

    .line 958
    sub-long/2addr v9, v11

    .line 959
    const/16 v28, 0x13

    move-wide v0, v15

    move/from16 v2, v28

    invoke-static {v0, v1, v2, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v15

    .line 960
    sub-long/2addr v13, v15

    .line 961
    const/16 v28, 0x25

    move-wide/from16 v0, v19

    move/from16 v2, v28

    move-wide/from16 v3, v17

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    move-result-wide v19

    .line 962
    sub-long v17, v17, v19

    .line 864
    add-int/lit8 v21, v21, -0x2

    goto/16 :goto_5c

    .line 968
    .end local v22    # "dm3":I
    .end local v23    # "dm9":I
    :cond_248
    const/16 v28, 0x0

    aget-wide v28, v24, v28

    sub-long v5, v5, v28

    .line 969
    const/16 v28, 0x1

    aget-wide v28, v24, v28

    sub-long v7, v7, v28

    .line 970
    const/16 v28, 0x2

    aget-wide v28, v24, v28

    sub-long v9, v9, v28

    .line 971
    const/16 v28, 0x3

    aget-wide v28, v24, v28

    sub-long v11, v11, v28

    .line 972
    const/16 v28, 0x4

    aget-wide v28, v24, v28

    sub-long v13, v13, v28

    .line 973
    const/16 v28, 0x5

    aget-wide v28, v24, v28

    const/16 v30, 0x0

    aget-wide v30, v27, v30

    add-long v28, v28, v30

    sub-long v15, v15, v28

    .line 974
    const/16 v28, 0x6

    aget-wide v28, v24, v28

    const/16 v30, 0x1

    aget-wide v30, v27, v30

    add-long v28, v28, v30

    sub-long v17, v17, v28

    .line 975
    const/16 v28, 0x7

    aget-wide v28, v24, v28

    sub-long v19, v19, v28

    .line 980
    const/16 v28, 0x0

    aput-wide v5, p2, v28

    .line 981
    const/16 v28, 0x1

    aput-wide v7, p2, v28

    .line 982
    const/16 v28, 0x2

    aput-wide v9, p2, v28

    .line 983
    const/16 v28, 0x3

    aput-wide v11, p2, v28

    .line 984
    const/16 v28, 0x4

    aput-wide v13, p2, v28

    .line 985
    const/16 v28, 0x5

    aput-wide v15, p2, v28

    .line 986
    const/16 v28, 0x6

    aput-wide v17, p2, v28

    .line 987
    const/16 v28, 0x7

    aput-wide v19, p2, v28

    .line 988
    return-void
.end method

.method public encryptBlock([J[J)V
    .registers 35
    .param p1, "block"    # [J
    .param p2, "out"    # [J

    .prologue
    .line 696
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/engines/ThreefishEngine$Threefish512Cipher;->kw:[J

    move-object/from16 v24, v0

    .line 697
    .local v24, "kw":[J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/engines/ThreefishEngine$Threefish512Cipher;->t:[J

    move-object/from16 v27, v0

    .line 698
    .local v27, "t":[J
    # getter for: Lorg/spongycastle/crypto/engines/ThreefishEngine;->MOD9:[I
    invoke-static {}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->access$200()[I

    move-result-object v26

    .line 699
    .local v26, "mod9":[I
    # getter for: Lorg/spongycastle/crypto/engines/ThreefishEngine;->MOD3:[I
    invoke-static {}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->access$100()[I

    move-result-object v25

    .line 702
    .local v25, "mod3":[I
    move-object/from16 v0, v24

    array-length v0, v0

    move/from16 v28, v0

    const/16 v29, 0x11

    move/from16 v0, v28

    move/from16 v1, v29

    if-eq v0, v1, :cond_27

    .line 704
    new-instance v28, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v28 .. v28}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v28

    .line 706
    :cond_27
    move-object/from16 v0, v27

    array-length v0, v0

    move/from16 v28, v0

    const/16 v29, 0x5

    move/from16 v0, v28

    move/from16 v1, v29

    if-eq v0, v1, :cond_3a

    .line 708
    new-instance v28, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v28 .. v28}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v28

    .line 714
    :cond_3a
    const/16 v28, 0x0

    aget-wide v5, p1, v28

    .line 715
    .local v5, "b0":J
    const/16 v28, 0x1

    aget-wide v7, p1, v28

    .line 716
    .local v7, "b1":J
    const/16 v28, 0x2

    aget-wide v9, p1, v28

    .line 717
    .local v9, "b2":J
    const/16 v28, 0x3

    aget-wide v11, p1, v28

    .line 718
    .local v11, "b3":J
    const/16 v28, 0x4

    aget-wide v13, p1, v28

    .line 719
    .local v13, "b4":J
    const/16 v28, 0x5

    aget-wide v15, p1, v28

    .line 720
    .local v15, "b5":J
    const/16 v28, 0x6

    aget-wide v17, p1, v28

    .line 721
    .local v17, "b6":J
    const/16 v28, 0x7

    aget-wide v19, p1, v28

    .line 726
    .local v19, "b7":J
    const/16 v28, 0x0

    aget-wide v28, v24, v28

    add-long v5, v5, v28

    .line 727
    const/16 v28, 0x1

    aget-wide v28, v24, v28

    add-long v7, v7, v28

    .line 728
    const/16 v28, 0x2

    aget-wide v28, v24, v28

    add-long v9, v9, v28

    .line 729
    const/16 v28, 0x3

    aget-wide v28, v24, v28

    add-long v11, v11, v28

    .line 730
    const/16 v28, 0x4

    aget-wide v28, v24, v28

    add-long v13, v13, v28

    .line 731
    const/16 v28, 0x5

    aget-wide v28, v24, v28

    const/16 v30, 0x0

    aget-wide v30, v27, v30

    add-long v28, v28, v30

    add-long v15, v15, v28

    .line 732
    const/16 v28, 0x6

    aget-wide v28, v24, v28

    const/16 v30, 0x1

    aget-wide v30, v27, v30

    add-long v28, v28, v30

    add-long v17, v17, v28

    .line 733
    const/16 v28, 0x7

    aget-wide v28, v24, v28

    add-long v19, v19, v28

    .line 746
    const/16 v21, 0x1

    .local v21, "d":I
    :goto_98
    const/16 v28, 0x12

    move/from16 v0, v21

    move/from16 v1, v28

    if-ge v0, v1, :cond_284

    .line 748
    aget v23, v26, v21

    .line 749
    .local v23, "dm9":I
    aget v22, v25, v21

    .line 757
    .local v22, "dm3":I
    const/16 v28, 0x2e

    add-long/2addr v5, v7

    move/from16 v0, v28

    invoke-static {v7, v8, v0, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v7

    .line 758
    const/16 v28, 0x24

    add-long/2addr v9, v11

    move/from16 v0, v28

    invoke-static {v11, v12, v0, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v11

    .line 759
    const/16 v28, 0x13

    add-long/2addr v13, v15

    move-wide v0, v15

    move/from16 v2, v28

    invoke-static {v0, v1, v2, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v15

    .line 760
    const/16 v28, 0x25

    add-long v17, v17, v19

    move-wide/from16 v0, v19

    move/from16 v2, v28

    move-wide/from16 v3, v17

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v19

    .line 762
    const/16 v28, 0x21

    add-long/2addr v9, v7

    move/from16 v0, v28

    invoke-static {v7, v8, v0, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v7

    .line 763
    const/16 v28, 0x1b

    add-long v13, v13, v19

    move-wide/from16 v0, v19

    move/from16 v2, v28

    invoke-static {v0, v1, v2, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v19

    .line 764
    const/16 v28, 0xe

    add-long v17, v17, v15

    move-wide v0, v15

    move/from16 v2, v28

    move-wide/from16 v3, v17

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v15

    .line 765
    const/16 v28, 0x2a

    add-long/2addr v5, v11

    move/from16 v0, v28

    invoke-static {v11, v12, v0, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v11

    .line 767
    const/16 v28, 0x11

    add-long/2addr v13, v7

    move/from16 v0, v28

    invoke-static {v7, v8, v0, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v7

    .line 768
    const/16 v28, 0x31

    add-long v17, v17, v11

    move/from16 v0, v28

    move-wide/from16 v1, v17

    invoke-static {v11, v12, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v11

    .line 769
    const/16 v28, 0x24

    add-long/2addr v5, v15

    move-wide v0, v15

    move/from16 v2, v28

    invoke-static {v0, v1, v2, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v15

    .line 770
    const/16 v28, 0x27

    add-long v9, v9, v19

    move-wide/from16 v0, v19

    move/from16 v2, v28

    invoke-static {v0, v1, v2, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v19

    .line 772
    const/16 v28, 0x2c

    add-long v17, v17, v7

    move/from16 v0, v28

    move-wide/from16 v1, v17

    invoke-static {v7, v8, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v7

    .line 773
    const/16 v28, 0x9

    add-long v5, v5, v19

    move-wide/from16 v0, v19

    move/from16 v2, v28

    invoke-static {v0, v1, v2, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v19

    .line 774
    const/16 v28, 0x36

    add-long/2addr v9, v15

    move-wide v0, v15

    move/from16 v2, v28

    invoke-static {v0, v1, v2, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v15

    .line 775
    const/16 v28, 0x38

    add-long/2addr v13, v11

    move/from16 v0, v28

    invoke-static {v11, v12, v0, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v11

    .line 780
    aget-wide v28, v24, v23

    add-long v5, v5, v28

    .line 781
    add-int/lit8 v28, v23, 0x1

    aget-wide v28, v24, v28

    add-long v7, v7, v28

    .line 782
    add-int/lit8 v28, v23, 0x2

    aget-wide v28, v24, v28

    add-long v9, v9, v28

    .line 783
    add-int/lit8 v28, v23, 0x3

    aget-wide v28, v24, v28

    add-long v11, v11, v28

    .line 784
    add-int/lit8 v28, v23, 0x4

    aget-wide v28, v24, v28

    add-long v13, v13, v28

    .line 785
    add-int/lit8 v28, v23, 0x5

    aget-wide v28, v24, v28

    aget-wide v30, v27, v22

    add-long v28, v28, v30

    add-long v15, v15, v28

    .line 786
    add-int/lit8 v28, v23, 0x6

    aget-wide v28, v24, v28

    add-int/lit8 v30, v22, 0x1

    aget-wide v30, v27, v30

    add-long v28, v28, v30

    add-long v17, v17, v28

    .line 787
    add-int/lit8 v28, v23, 0x7

    aget-wide v28, v24, v28

    move/from16 v0, v21

    int-to-long v0, v0

    move-wide/from16 v30, v0

    add-long v28, v28, v30

    add-long v19, v19, v28

    .line 792
    const/16 v28, 0x27

    add-long/2addr v5, v7

    move/from16 v0, v28

    invoke-static {v7, v8, v0, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v7

    .line 793
    const/16 v28, 0x1e

    add-long/2addr v9, v11

    move/from16 v0, v28

    invoke-static {v11, v12, v0, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v11

    .line 794
    const/16 v28, 0x22

    add-long/2addr v13, v15

    move-wide v0, v15

    move/from16 v2, v28

    invoke-static {v0, v1, v2, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v15

    .line 795
    const/16 v28, 0x18

    add-long v17, v17, v19

    move-wide/from16 v0, v19

    move/from16 v2, v28

    move-wide/from16 v3, v17

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v19

    .line 797
    const/16 v28, 0xd

    add-long/2addr v9, v7

    move/from16 v0, v28

    invoke-static {v7, v8, v0, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v7

    .line 798
    const/16 v28, 0x32

    add-long v13, v13, v19

    move-wide/from16 v0, v19

    move/from16 v2, v28

    invoke-static {v0, v1, v2, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v19

    .line 799
    const/16 v28, 0xa

    add-long v17, v17, v15

    move-wide v0, v15

    move/from16 v2, v28

    move-wide/from16 v3, v17

    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v15

    .line 800
    const/16 v28, 0x11

    add-long/2addr v5, v11

    move/from16 v0, v28

    invoke-static {v11, v12, v0, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v11

    .line 802
    const/16 v28, 0x19

    add-long/2addr v13, v7

    move/from16 v0, v28

    invoke-static {v7, v8, v0, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v7

    .line 803
    const/16 v28, 0x1d

    add-long v17, v17, v11

    move/from16 v0, v28

    move-wide/from16 v1, v17

    invoke-static {v11, v12, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v11

    .line 804
    const/16 v28, 0x27

    add-long/2addr v5, v15

    move-wide v0, v15

    move/from16 v2, v28

    invoke-static {v0, v1, v2, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v15

    .line 805
    const/16 v28, 0x2b

    add-long v9, v9, v19

    move-wide/from16 v0, v19

    move/from16 v2, v28

    invoke-static {v0, v1, v2, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v19

    .line 807
    const/16 v28, 0x8

    add-long v17, v17, v7

    move/from16 v0, v28

    move-wide/from16 v1, v17

    invoke-static {v7, v8, v0, v1, v2}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v7

    .line 808
    const/16 v28, 0x23

    add-long v5, v5, v19

    move-wide/from16 v0, v19

    move/from16 v2, v28

    invoke-static {v0, v1, v2, v5, v6}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v19

    .line 809
    const/16 v28, 0x38

    add-long/2addr v9, v15

    move-wide v0, v15

    move/from16 v2, v28

    invoke-static {v0, v1, v2, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v15

    .line 810
    const/16 v28, 0x16

    add-long/2addr v13, v11

    move/from16 v0, v28

    invoke-static {v11, v12, v0, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    move-result-wide v11

    .line 815
    add-int/lit8 v28, v23, 0x1

    aget-wide v28, v24, v28

    add-long v5, v5, v28

    .line 816
    add-int/lit8 v28, v23, 0x2

    aget-wide v28, v24, v28

    add-long v7, v7, v28

    .line 817
    add-int/lit8 v28, v23, 0x3

    aget-wide v28, v24, v28

    add-long v9, v9, v28

    .line 818
    add-int/lit8 v28, v23, 0x4

    aget-wide v28, v24, v28

    add-long v11, v11, v28

    .line 819
    add-int/lit8 v28, v23, 0x5

    aget-wide v28, v24, v28

    add-long v13, v13, v28

    .line 820
    add-int/lit8 v28, v23, 0x6

    aget-wide v28, v24, v28

    add-int/lit8 v30, v22, 0x1

    aget-wide v30, v27, v30

    add-long v28, v28, v30

    add-long v15, v15, v28

    .line 821
    add-int/lit8 v28, v23, 0x7

    aget-wide v28, v24, v28

    add-int/lit8 v30, v22, 0x2

    aget-wide v30, v27, v30

    add-long v28, v28, v30

    add-long v17, v17, v28

    .line 822
    add-int/lit8 v28, v23, 0x8

    aget-wide v28, v24, v28

    move/from16 v0, v21

    int-to-long v0, v0

    move-wide/from16 v30, v0

    add-long v28, v28, v30

    const-wide/16 v30, 0x1

    add-long v28, v28, v30

    add-long v19, v19, v28

    .line 746
    add-int/lit8 v21, v21, 0x2

    goto/16 :goto_98

    .line 828
    .end local v22    # "dm3":I
    .end local v23    # "dm9":I
    :cond_284
    const/16 v28, 0x0

    aput-wide v5, p2, v28

    .line 829
    const/16 v28, 0x1

    aput-wide v7, p2, v28

    .line 830
    const/16 v28, 0x2

    aput-wide v9, p2, v28

    .line 831
    const/16 v28, 0x3

    aput-wide v11, p2, v28

    .line 832
    const/16 v28, 0x4

    aput-wide v13, p2, v28

    .line 833
    const/16 v28, 0x5

    aput-wide v15, p2, v28

    .line 834
    const/16 v28, 0x6

    aput-wide v17, p2, v28

    .line 835
    const/16 v28, 0x7

    aput-wide v19, p2, v28

    .line 836
    return-void
.end method
