.class Lkorex/mail/internet/MailDateParser;
.super Ljava/lang/Object;
.source "MailDateFormat.java"


# instance fields
.field index:I

.field orig:[C


# direct methods
.method public constructor <init>([CI)V
    .registers 4
    .param p1, "orig"    # [C
    .param p2, "index"    # I

    .prologue
    .line 468
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 465
    const/4 v0, 0x0

    iput v0, p0, Lkorex/mail/internet/MailDateParser;->index:I

    .line 466
    const/4 v0, 0x0

    iput-object v0, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    .line 469
    iput-object p1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    .line 470
    iput p2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    .line 471
    return-void
.end method


# virtual methods
.method getIndex()I
    .registers 2

    .prologue
    .line 911
    iget v0, p0, Lkorex/mail/internet/MailDateParser;->index:I

    return v0
.end method

.method public parseAlphaTimeZone()I
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x74

    const/16 v7, 0x54

    .line 831
    const/4 v3, 0x0

    .line 832
    .local v3, "result":I
    const/4 v2, 0x0

    .line 836
    .local v2, "foundCommon":Z
    :try_start_6
    iget-object v4, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v5, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v4, v4, v5

    sparse-switch v4, :sswitch_data_cc

    .line 883
    new-instance v4, Ljava/text/ParseException;

    const-string v5, "Bad Alpha TimeZone"

    iget v6, p0, Lkorex/mail/internet/MailDateParser;->index:I

    invoke-direct {v4, v5, v6}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v4
    :try_end_1d
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_6 .. :try_end_1d} :catch_1d

    .line 885
    :catch_1d
    move-exception v1

    .line 886
    .local v1, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v4, Ljava/text/ParseException;

    const-string v5, "Bad Alpha TimeZone"

    iget v6, p0, Lkorex/mail/internet/MailDateParser;->index:I

    invoke-direct {v4, v5, v6}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v4

    .line 839
    .end local v1    # "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    :sswitch_28
    :try_start_28
    iget-object v4, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v5, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v4, v5
    :try_end_32
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_28 .. :try_end_32} :catch_1d

    .line 840
    .local v0, "curr":C
    if-eq v0, v7, :cond_36

    if-ne v0, v8, :cond_63

    .line 841
    :cond_36
    const/4 v3, 0x0

    .line 889
    .end local v0    # "curr":C
    :goto_37
    if-eqz v2, :cond_c1

    .line 890
    iget-object v4, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v5, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v4, v5

    .line 891
    .restart local v0    # "curr":C
    const/16 v4, 0x53

    if-eq v0, v4, :cond_4b

    const/16 v4, 0x73

    if-ne v0, v4, :cond_a9

    .line 892
    :cond_4b
    iget-object v4, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v5, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v4, v5

    .line 893
    if-eq v0, v7, :cond_c1

    if-eq v0, v8, :cond_c1

    .line 894
    new-instance v4, Ljava/text/ParseException;

    const-string v5, "Bad Alpha TimeZone"

    iget v6, p0, Lkorex/mail/internet/MailDateParser;->index:I

    invoke-direct {v4, v5, v6}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v4

    .line 844
    :cond_63
    :try_start_63
    new-instance v4, Ljava/text/ParseException;

    const-string v5, "Bad Alpha TimeZone"

    iget v6, p0, Lkorex/mail/internet/MailDateParser;->index:I

    invoke-direct {v4, v5, v6}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v4

    .line 848
    .end local v0    # "curr":C
    :sswitch_6d
    iget-object v4, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v5, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v4, v5

    .line 849
    .restart local v0    # "curr":C
    const/16 v4, 0x4d

    if-eq v0, v4, :cond_7f

    const/16 v4, 0x6d

    if-ne v0, v4, :cond_8f

    .line 850
    :cond_7f
    iget-object v4, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v5, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v4, v5

    .line 851
    if-eq v0, v7, :cond_8d

    if-ne v0, v8, :cond_8f

    .line 852
    :cond_8d
    const/4 v3, 0x0

    .line 853
    goto :goto_37

    .line 856
    :cond_8f
    new-instance v4, Ljava/text/ParseException;

    const-string v5, "Bad Alpha TimeZone"

    iget v6, p0, Lkorex/mail/internet/MailDateParser;->index:I

    invoke-direct {v4, v5, v6}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v4
    :try_end_99
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_63 .. :try_end_99} :catch_1d

    .line 860
    .end local v0    # "curr":C
    :sswitch_99
    const/16 v3, 0x12c

    .line 861
    const/4 v2, 0x1

    .line 862
    goto :goto_37

    .line 866
    :sswitch_9d
    const/16 v3, 0x168

    .line 867
    const/4 v2, 0x1

    .line 868
    goto :goto_37

    .line 872
    :sswitch_a1
    const/16 v3, 0x1a4

    .line 873
    const/4 v2, 0x1

    .line 874
    goto :goto_37

    .line 878
    :sswitch_a5
    const/16 v3, 0x1e0

    .line 879
    const/4 v2, 0x1

    .line 880
    goto :goto_37

    .line 896
    .restart local v0    # "curr":C
    :cond_a9
    const/16 v4, 0x44

    if-eq v0, v4, :cond_b1

    const/16 v4, 0x64

    if-ne v0, v4, :cond_c1

    .line 897
    :cond_b1
    iget-object v4, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v5, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v4, v5

    .line 898
    if-eq v0, v7, :cond_bf

    if-eq v0, v8, :cond_c2

    .line 900
    :cond_bf
    add-int/lit8 v3, v3, -0x3c

    .line 907
    .end local v0    # "curr":C
    :cond_c1
    return v3

    .line 902
    .restart local v0    # "curr":C
    :cond_c2
    new-instance v4, Ljava/text/ParseException;

    const-string v5, "Bad Alpha TimeZone"

    iget v6, p0, Lkorex/mail/internet/MailDateParser;->index:I

    invoke-direct {v4, v5, v6}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v4

    .line 836
    :sswitch_data_cc
    .sparse-switch
        0x43 -> :sswitch_9d
        0x45 -> :sswitch_99
        0x47 -> :sswitch_6d
        0x4d -> :sswitch_a1
        0x50 -> :sswitch_a5
        0x55 -> :sswitch_28
        0x63 -> :sswitch_9d
        0x65 -> :sswitch_99
        0x67 -> :sswitch_6d
        0x6d -> :sswitch_a1
        0x70 -> :sswitch_a5
        0x75 -> :sswitch_28
    .end sparse-switch
.end method

.method public parseMonth()I
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x50

    const/16 v7, 0x4e

    const/16 v6, 0x43

    const/16 v5, 0x65

    const/16 v4, 0x45

    .line 661
    :try_start_a
    iget-object v1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v1, v1, v2
    :try_end_14
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_a .. :try_end_14} :catch_183

    sparse-switch v1, :sswitch_data_186

    .line 773
    :cond_17
    :goto_17
    new-instance v1, Ljava/text/ParseException;

    const-string v2, "Bad Month"

    iget v3, p0, Lkorex/mail/internet/MailDateParser;->index:I

    invoke-direct {v1, v2, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 665
    :sswitch_21
    :try_start_21
    iget-object v1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v1, v1, v2

    sparse-switch v1, :sswitch_data_1c8

    goto :goto_17

    .line 668
    :sswitch_2f
    iget-object v1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v1, v2

    .line 669
    .local v0, "curr":C
    if-eq v0, v7, :cond_3f

    const/16 v1, 0x6e

    if-ne v0, v1, :cond_17

    .line 670
    :cond_3f
    const/4 v1, 0x0

    .line 765
    :goto_40
    return v1

    .line 676
    .end local v0    # "curr":C
    :sswitch_41
    iget-object v1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v1, v2

    .line 677
    .restart local v0    # "curr":C
    if-eq v0, v7, :cond_51

    const/16 v1, 0x6e

    if-ne v0, v1, :cond_53

    .line 678
    :cond_51
    const/4 v1, 0x5

    goto :goto_40

    .line 679
    :cond_53
    const/16 v1, 0x4c

    if-eq v0, v1, :cond_5b

    const/16 v1, 0x6c

    if-ne v0, v1, :cond_17

    .line 680
    :cond_5b
    const/4 v1, 0x6

    goto :goto_40

    .line 688
    .end local v0    # "curr":C
    :sswitch_5d
    iget-object v1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v1, v2

    .line 689
    .restart local v0    # "curr":C
    if-eq v0, v4, :cond_6b

    if-ne v0, v5, :cond_17

    .line 690
    :cond_6b
    iget-object v1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v1, v2

    .line 691
    const/16 v1, 0x42

    if-eq v0, v1, :cond_7d

    const/16 v1, 0x62

    if-ne v0, v1, :cond_17

    .line 692
    :cond_7d
    const/4 v1, 0x1

    goto :goto_40

    .line 699
    .end local v0    # "curr":C
    :sswitch_7f
    iget-object v1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v1, v2

    .line 700
    .restart local v0    # "curr":C
    const/16 v1, 0x41

    if-eq v0, v1, :cond_91

    const/16 v1, 0x61

    if-ne v0, v1, :cond_17

    .line 701
    :cond_91
    iget-object v1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v1, v2

    .line 702
    const/16 v1, 0x52

    if-eq v0, v1, :cond_a3

    const/16 v1, 0x72

    if-ne v0, v1, :cond_a5

    .line 703
    :cond_a3
    const/4 v1, 0x2

    goto :goto_40

    .line 704
    :cond_a5
    const/16 v1, 0x59

    if-eq v0, v1, :cond_ad

    const/16 v1, 0x79

    if-ne v0, v1, :cond_17

    .line 705
    :cond_ad
    const/4 v1, 0x4

    goto :goto_40

    .line 712
    .end local v0    # "curr":C
    :sswitch_af
    iget-object v1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v1, v2

    .line 713
    .restart local v0    # "curr":C
    if-eq v0, v8, :cond_bf

    const/16 v1, 0x70

    if-ne v0, v1, :cond_d4

    .line 714
    :cond_bf
    iget-object v1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v1, v2

    .line 715
    const/16 v1, 0x52

    if-eq v0, v1, :cond_d1

    const/16 v1, 0x72

    if-ne v0, v1, :cond_17

    .line 716
    :cond_d1
    const/4 v1, 0x3

    goto/16 :goto_40

    .line 718
    :cond_d4
    const/16 v1, 0x55

    if-eq v0, v1, :cond_dc

    const/16 v1, 0x75

    if-ne v0, v1, :cond_17

    .line 719
    :cond_dc
    iget-object v1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v1, v2

    .line 720
    const/16 v1, 0x47

    if-eq v0, v1, :cond_ee

    const/16 v1, 0x67

    if-ne v0, v1, :cond_17

    .line 721
    :cond_ee
    const/4 v1, 0x7

    goto/16 :goto_40

    .line 728
    .end local v0    # "curr":C
    :sswitch_f1
    iget-object v1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v1, v2

    .line 729
    .restart local v0    # "curr":C
    if-eq v0, v4, :cond_ff

    if-ne v0, v5, :cond_17

    .line 730
    :cond_ff
    iget-object v1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v1, v2

    .line 731
    if-eq v0, v8, :cond_10f

    const/16 v1, 0x70

    if-ne v0, v1, :cond_17

    .line 732
    :cond_10f
    const/16 v1, 0x8

    goto/16 :goto_40

    .line 739
    .end local v0    # "curr":C
    :sswitch_113
    iget-object v1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v1, v2

    .line 740
    .restart local v0    # "curr":C
    if-eq v0, v6, :cond_123

    const/16 v1, 0x63

    if-ne v0, v1, :cond_17

    .line 741
    :cond_123
    iget-object v1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v1, v2

    .line 742
    const/16 v1, 0x54

    if-eq v0, v1, :cond_135

    const/16 v1, 0x74

    if-ne v0, v1, :cond_17

    .line 743
    :cond_135
    const/16 v1, 0x9

    goto/16 :goto_40

    .line 750
    .end local v0    # "curr":C
    :sswitch_139
    iget-object v1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v1, v2

    .line 751
    .restart local v0    # "curr":C
    const/16 v1, 0x4f

    if-eq v0, v1, :cond_14b

    const/16 v1, 0x6f

    if-ne v0, v1, :cond_17

    .line 752
    :cond_14b
    iget-object v1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v1, v2

    .line 753
    const/16 v1, 0x56

    if-eq v0, v1, :cond_15d

    const/16 v1, 0x76

    if-ne v0, v1, :cond_17

    .line 754
    :cond_15d
    const/16 v1, 0xa

    goto/16 :goto_40

    .line 761
    .end local v0    # "curr":C
    :sswitch_161
    iget-object v1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v1, v2

    .line 762
    .restart local v0    # "curr":C
    if-eq v0, v4, :cond_16f

    if-ne v0, v5, :cond_17

    .line 763
    :cond_16f
    iget-object v1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v1, v2
    :try_end_179
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_21 .. :try_end_179} :catch_183

    .line 764
    if-eq v0, v6, :cond_17f

    const/16 v1, 0x63

    if-ne v0, v1, :cond_17

    .line 765
    :cond_17f
    const/16 v1, 0xb

    goto/16 :goto_40

    .line 770
    .end local v0    # "curr":C
    :catch_183
    move-exception v1

    goto/16 :goto_17

    .line 661
    :sswitch_data_186
    .sparse-switch
        0x41 -> :sswitch_af
        0x44 -> :sswitch_161
        0x46 -> :sswitch_5d
        0x4a -> :sswitch_21
        0x4d -> :sswitch_7f
        0x4e -> :sswitch_139
        0x4f -> :sswitch_113
        0x53 -> :sswitch_f1
        0x61 -> :sswitch_af
        0x64 -> :sswitch_161
        0x66 -> :sswitch_5d
        0x6a -> :sswitch_21
        0x6d -> :sswitch_7f
        0x6e -> :sswitch_139
        0x6f -> :sswitch_113
        0x73 -> :sswitch_f1
    .end sparse-switch

    .line 665
    :sswitch_data_1c8
    .sparse-switch
        0x41 -> :sswitch_2f
        0x55 -> :sswitch_41
        0x61 -> :sswitch_2f
        0x75 -> :sswitch_41
    .end sparse-switch
.end method

.method public parseNumber()I
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 577
    iget-object v3, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    array-length v1, v3

    .line 578
    .local v1, "length":I
    const/4 v0, 0x0

    .line 579
    .local v0, "gotNum":Z
    const/4 v2, 0x0

    .line 581
    .local v2, "result":I
    :goto_5
    iget v3, p0, Lkorex/mail/internet/MailDateParser;->index:I

    if-ge v3, v1, :cond_5f

    .line 582
    iget-object v3, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v4, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v3, v3, v4

    packed-switch v3, :pswitch_data_6c

    .line 634
    if-eqz v0, :cond_55

    .line 645
    :cond_14
    return v2

    .line 584
    :pswitch_15
    mul-int/lit8 v2, v2, 0xa

    .line 585
    const/4 v0, 0x1

    .line 640
    :goto_18
    iget v3, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lkorex/mail/internet/MailDateParser;->index:I

    goto :goto_5

    .line 589
    :pswitch_1f
    mul-int/lit8 v3, v2, 0xa

    add-int/lit8 v2, v3, 0x1

    .line 590
    const/4 v0, 0x1

    .line 591
    goto :goto_18

    .line 594
    :pswitch_25
    mul-int/lit8 v3, v2, 0xa

    add-int/lit8 v2, v3, 0x2

    .line 595
    const/4 v0, 0x1

    .line 596
    goto :goto_18

    .line 599
    :pswitch_2b
    mul-int/lit8 v3, v2, 0xa

    add-int/lit8 v2, v3, 0x3

    .line 600
    const/4 v0, 0x1

    .line 601
    goto :goto_18

    .line 604
    :pswitch_31
    mul-int/lit8 v3, v2, 0xa

    add-int/lit8 v2, v3, 0x4

    .line 605
    const/4 v0, 0x1

    .line 606
    goto :goto_18

    .line 609
    :pswitch_37
    mul-int/lit8 v3, v2, 0xa

    add-int/lit8 v2, v3, 0x5

    .line 610
    const/4 v0, 0x1

    .line 611
    goto :goto_18

    .line 614
    :pswitch_3d
    mul-int/lit8 v3, v2, 0xa

    add-int/lit8 v2, v3, 0x6

    .line 615
    const/4 v0, 0x1

    .line 616
    goto :goto_18

    .line 619
    :pswitch_43
    mul-int/lit8 v3, v2, 0xa

    add-int/lit8 v2, v3, 0x7

    .line 620
    const/4 v0, 0x1

    .line 621
    goto :goto_18

    .line 624
    :pswitch_49
    mul-int/lit8 v3, v2, 0xa

    add-int/lit8 v2, v3, 0x8

    .line 625
    const/4 v0, 0x1

    .line 626
    goto :goto_18

    .line 629
    :pswitch_4f
    mul-int/lit8 v3, v2, 0xa

    add-int/lit8 v2, v3, 0x9

    .line 630
    const/4 v0, 0x1

    .line 631
    goto :goto_18

    .line 637
    :cond_55
    new-instance v3, Ljava/text/ParseException;

    const-string v4, "No Number found"

    iget v5, p0, Lkorex/mail/internet/MailDateParser;->index:I

    invoke-direct {v3, v4, v5}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v3

    .line 644
    :cond_5f
    if-nez v0, :cond_14

    .line 648
    new-instance v3, Ljava/text/ParseException;

    const-string v4, "No Number found"

    iget v5, p0, Lkorex/mail/internet/MailDateParser;->index:I

    invoke-direct {v3, v4, v5}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v3

    .line 582
    nop

    :pswitch_data_6c
    .packed-switch 0x30
        :pswitch_15
        :pswitch_1f
        :pswitch_25
        :pswitch_2b
        :pswitch_31
        :pswitch_37
        :pswitch_3d
        :pswitch_43
        :pswitch_49
        :pswitch_4f
    .end packed-switch
.end method

.method public parseNumericTimeZone()I
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 805
    const/4 v3, 0x0

    .line 806
    .local v3, "switchSign":Z
    iget-object v5, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v6, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v7, v6, 0x1

    iput v7, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v5, v6

    .line 807
    .local v0, "first":C
    const/16 v5, 0x2b

    if-ne v0, v5, :cond_22

    .line 808
    const/4 v3, 0x1

    .line 813
    :cond_10
    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    .line 814
    .local v2, "oindex":I
    invoke-virtual {p0}, Lkorex/mail/internet/MailDateParser;->parseNumber()I

    move-result v4

    .line 815
    .local v4, "tz":I
    const/16 v5, 0x960

    if-lt v4, v5, :cond_30

    .line 816
    new-instance v5, Ljava/text/ParseException;

    const-string v6, "Numeric TimeZone out of range"

    invoke-direct {v5, v6, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v5

    .line 809
    .end local v2    # "oindex":I
    .end local v4    # "tz":I
    :cond_22
    const/16 v5, 0x2d

    if-eq v0, v5, :cond_10

    .line 810
    new-instance v5, Ljava/text/ParseException;

    const-string v6, "Bad Numeric TimeZone"

    iget v7, p0, Lkorex/mail/internet/MailDateParser;->index:I

    invoke-direct {v5, v6, v7}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v5

    .line 817
    .restart local v2    # "oindex":I
    .restart local v4    # "tz":I
    :cond_30
    div-int/lit8 v5, v4, 0x64

    mul-int/lit8 v5, v5, 0x3c

    rem-int/lit8 v6, v4, 0x64

    add-int v1, v5, v6

    .line 818
    .local v1, "offset":I
    if-eqz v3, :cond_3b

    .line 819
    neg-int v1, v1

    .line 821
    .end local v1    # "offset":I
    :cond_3b
    return v1
.end method

.method public parseTimeZone()I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 782
    iget v1, p0, Lkorex/mail/internet/MailDateParser;->index:I

    iget-object v2, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    array-length v2, v2

    if-lt v1, v2, :cond_11

    .line 783
    new-instance v1, Ljava/text/ParseException;

    const-string v2, "No more characters"

    iget v3, p0, Lkorex/mail/internet/MailDateParser;->index:I

    invoke-direct {v1, v2, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 785
    :cond_11
    iget-object v1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v1, v2

    .line 786
    .local v0, "test":C
    const/16 v1, 0x2b

    if-eq v0, v1, :cond_1f

    const/16 v1, 0x2d

    if-ne v0, v1, :cond_24

    .line 787
    :cond_1f
    invoke-virtual {p0}, Lkorex/mail/internet/MailDateParser;->parseNumericTimeZone()I

    move-result v1

    .line 789
    :goto_23
    return v1

    :cond_24
    invoke-virtual {p0}, Lkorex/mail/internet/MailDateParser;->parseAlphaTimeZone()I

    move-result v1

    goto :goto_23
.end method

.method public peekChar()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 531
    iget v0, p0, Lkorex/mail/internet/MailDateParser;->index:I

    iget-object v1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    array-length v1, v1

    if-ge v0, v1, :cond_e

    .line 532
    iget-object v0, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v1, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v0, v1

    return v0

    .line 534
    :cond_e
    new-instance v0, Ljava/text/ParseException;

    const-string v1, "No more characters"

    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    invoke-direct {v0, v1, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public skipChar(C)V
    .registers 5
    .param p1, "c"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 542
    iget v0, p0, Lkorex/mail/internet/MailDateParser;->index:I

    iget-object v1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    array-length v1, v1

    if-ge v0, v1, :cond_20

    .line 543
    iget-object v0, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v1, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v0, v1

    if-ne v0, p1, :cond_16

    .line 544
    iget v0, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lkorex/mail/internet/MailDateParser;->index:I

    .line 551
    return-void

    .line 546
    :cond_16
    new-instance v0, Ljava/text/ParseException;

    const-string v1, "Wrong char"

    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    invoke-direct {v0, v1, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 549
    :cond_20
    new-instance v0, Ljava/text/ParseException;

    const-string v1, "No more characters"

    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    invoke-direct {v0, v1, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public skipIfChar(C)Z
    .registers 5
    .param p1, "c"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 558
    iget v0, p0, Lkorex/mail/internet/MailDateParser;->index:I

    iget-object v1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    array-length v1, v1

    if-ge v0, v1, :cond_19

    .line 559
    iget-object v0, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v1, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v0, v0, v1

    if-ne v0, p1, :cond_17

    .line 560
    iget v0, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lkorex/mail/internet/MailDateParser;->index:I

    .line 561
    const/4 v0, 0x1

    .line 563
    :goto_16
    return v0

    :cond_17
    const/4 v0, 0x0

    goto :goto_16

    .line 566
    :cond_19
    new-instance v0, Ljava/text/ParseException;

    const-string v1, "No more characters"

    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    invoke-direct {v0, v1, v2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public skipUntilNumber()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 482
    :goto_0
    :try_start_0
    iget-object v1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v1, v1, v2

    packed-switch v1, :pswitch_data_1c

    .line 496
    iget v1, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lkorex/mail/internet/MailDateParser;->index:I
    :try_end_f
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_f} :catch_10

    goto :goto_0

    .line 500
    :catch_10
    move-exception v0

    .line 501
    .local v0, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v1, Ljava/text/ParseException;

    const-string v2, "No Number Found"

    iget v3, p0, Lkorex/mail/internet/MailDateParser;->index:I

    invoke-direct {v1, v2, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 493
    .end local v0    # "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    :pswitch_1b
    return-void

    .line 482
    :pswitch_data_1c
    .packed-switch 0x30
        :pswitch_1b
        :pswitch_1b
        :pswitch_1b
        :pswitch_1b
        :pswitch_1b
        :pswitch_1b
        :pswitch_1b
        :pswitch_1b
        :pswitch_1b
        :pswitch_1b
    .end packed-switch
.end method

.method public skipWhiteSpace()V
    .registers 4

    .prologue
    .line 509
    iget-object v1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    array-length v0, v1

    .line 510
    .local v0, "len":I
    :goto_3
    iget v1, p0, Lkorex/mail/internet/MailDateParser;->index:I

    if-ge v1, v0, :cond_10

    .line 511
    iget-object v1, p0, Lkorex/mail/internet/MailDateParser;->orig:[C

    iget v2, p0, Lkorex/mail/internet/MailDateParser;->index:I

    aget-char v1, v1, v2

    sparse-switch v1, :sswitch_data_18

    .line 523
    :cond_10
    return-void

    .line 516
    :sswitch_11
    iget v1, p0, Lkorex/mail/internet/MailDateParser;->index:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lkorex/mail/internet/MailDateParser;->index:I

    goto :goto_3

    .line 511
    :sswitch_data_18
    .sparse-switch
        0x9 -> :sswitch_11
        0xa -> :sswitch_11
        0xd -> :sswitch_11
        0x20 -> :sswitch_11
    .end sparse-switch
.end method
