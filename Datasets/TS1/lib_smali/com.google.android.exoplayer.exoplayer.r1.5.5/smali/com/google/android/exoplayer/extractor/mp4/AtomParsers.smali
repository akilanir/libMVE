.class final Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;
.super Ljava/lang/Object;
.source "AtomParsers.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$AvcCData;,
        Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;,
        Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$TkhdData;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 991
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 993
    return-void
.end method

.method private static findEsdsPosition(Lcom/google/android/exoplayer/util/ParsableByteArray;II)I
    .registers 8
    .param p0, "parent"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "position"    # I
    .param p2, "size"    # I

    .prologue
    .line 891
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v0

    .line 892
    .local v0, "childAtomPosition":I
    :goto_4
    sub-int v3, v0, p1

    if-ge v3, p2, :cond_24

    .line 893
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 894
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v1

    .line 895
    .local v1, "childAtomSize":I
    if-lez v1, :cond_20

    const/4 v3, 0x1

    :goto_12
    const-string v4, "childAtomSize should be positive"

    invoke-static {v3, v4}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(ZLjava/lang/Object;)V

    .line 896
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v2

    .line 897
    .local v2, "childType":I
    sget v3, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_esds:I

    if-ne v2, v3, :cond_22

    .line 902
    .end local v0    # "childAtomPosition":I
    .end local v1    # "childAtomSize":I
    .end local v2    # "childType":I
    :goto_1f
    return v0

    .line 895
    .restart local v0    # "childAtomPosition":I
    .restart local v1    # "childAtomSize":I
    :cond_20
    const/4 v3, 0x0

    goto :goto_12

    .line 900
    .restart local v2    # "childType":I
    :cond_22
    add-int/2addr v0, v1

    .line 901
    goto :goto_4

    .line 902
    .end local v1    # "childAtomSize":I
    .end local v2    # "childType":I
    :cond_24
    const/4 v0, -0x1

    goto :goto_1f
.end method

.method private static parseAudioSampleEntry(Lcom/google/android/exoplayer/util/ParsableByteArray;IIIIJLjava/lang/String;ZLcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;I)V
    .registers 33
    .param p0, "parent"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "atomType"    # I
    .param p2, "position"    # I
    .param p3, "size"    # I
    .param p4, "trackId"    # I
    .param p5, "durationUs"    # J
    .param p7, "language"    # Ljava/lang/String;
    .param p8, "isQuickTime"    # Z
    .param p9, "out"    # Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;
    .param p10, "entryIndex"    # I

    .prologue
    .line 783
    add-int/lit8 v4, p2, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 785
    const/16 v21, 0x0

    .line 786
    .local v21, "quickTimeSoundDescriptionVersion":I
    if-eqz p8, :cond_bd

    .line 787
    const/16 v4, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 788
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v21

    .line 789
    const/4 v4, 0x6

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 794
    :goto_1c
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v10

    .line 795
    .local v10, "channelCount":I
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v7

    .line 796
    .local v7, "sampleSize":I
    const/4 v4, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 797
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedFixedPoint1616()I

    move-result v11

    .line 799
    .local v11, "sampleRate":I
    if-lez v21, :cond_43

    .line 800
    const/16 v4, 0x10

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 801
    const/4 v4, 0x2

    move/from16 v0, v21

    if-ne v0, v4, :cond_43

    .line 802
    const/16 v4, 0x14

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 807
    :cond_43
    const/4 v5, 0x0

    .line 808
    .local v5, "mimeType":Ljava/lang/String;
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_ac_3:I

    move/from16 v0, p1

    if-ne v0, v4, :cond_c6

    .line 809
    const-string v5, "audio/ac3"

    .line 824
    :cond_4c
    :goto_4c
    const/16 v19, 0x0

    .line 825
    .local v19, "initializationData":[B
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v15

    .line 826
    .local v15, "childAtomPosition":I
    :goto_52
    sub-int v4, v15, p2

    move/from16 v0, p3

    if-ge v4, v0, :cond_1b0

    .line 827
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 828
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v16

    .line 829
    .local v16, "childAtomSize":I
    if-lez v16, :cond_108

    const/4 v4, 0x1

    :goto_64
    const-string v6, "childAtomSize should be positive"

    invoke-static {v4, v6}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(ZLjava/lang/Object;)V

    .line 830
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v17

    .line 831
    .local v17, "childAtomType":I
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mp4a:I

    move/from16 v0, p1

    if-eq v0, v4, :cond_79

    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_enca:I

    move/from16 v0, p1

    if-ne v0, v4, :cond_132

    .line 832
    :cond_79
    const/16 v18, -0x1

    .line 833
    .local v18, "esdsAtomPosition":I
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_esds:I

    move/from16 v0, v17

    if-ne v0, v4, :cond_10b

    .line 834
    move/from16 v18, v15

    .line 838
    :cond_83
    :goto_83
    const/4 v4, -0x1

    move/from16 v0, v18

    if-eq v0, v4, :cond_11d

    .line 839
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-static {v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseEsdsFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)Landroid/util/Pair;

    move-result-object v20

    .line 841
    .local v20, "mimeTypeAndInitializationData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;[B>;"
    move-object/from16 v0, v20

    iget-object v5, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .end local v5    # "mimeType":Ljava/lang/String;
    check-cast v5, Ljava/lang/String;

    .line 842
    .restart local v5    # "mimeType":Ljava/lang/String;
    move-object/from16 v0, v20

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    move-object/from16 v19, v0

    .end local v19    # "initializationData":[B
    check-cast v19, [B

    .line 843
    .restart local v19    # "initializationData":[B
    const-string v4, "audio/mp4a-latm"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ba

    .line 846
    invoke-static/range {v19 .. v19}, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->parseAacAudioSpecificConfig([B)Landroid/util/Pair;

    move-result-object v14

    .line 848
    .local v14, "audioSpecificConfig":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    iget-object v4, v14, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v11

    .line 849
    iget-object v4, v14, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v10

    .line 875
    .end local v14    # "audioSpecificConfig":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .end local v18    # "esdsAtomPosition":I
    .end local v20    # "mimeTypeAndInitializationData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;[B>;"
    :cond_ba
    :goto_ba
    add-int v15, v15, v16

    .line 876
    goto :goto_52

    .line 791
    .end local v5    # "mimeType":Ljava/lang/String;
    .end local v7    # "sampleSize":I
    .end local v10    # "channelCount":I
    .end local v11    # "sampleRate":I
    .end local v15    # "childAtomPosition":I
    .end local v16    # "childAtomSize":I
    .end local v17    # "childAtomType":I
    .end local v19    # "initializationData":[B
    :cond_bd
    const/16 v4, 0x10

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    goto/16 :goto_1c

    .line 810
    .restart local v5    # "mimeType":Ljava/lang/String;
    .restart local v7    # "sampleSize":I
    .restart local v10    # "channelCount":I
    .restart local v11    # "sampleRate":I
    :cond_c6
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_ec_3:I

    move/from16 v0, p1

    if-ne v0, v4, :cond_d0

    .line 811
    const-string v5, "audio/eac3"

    goto/16 :goto_4c

    .line 812
    :cond_d0
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_dtsc:I

    move/from16 v0, p1

    if-ne v0, v4, :cond_da

    .line 813
    const-string v5, "audio/vnd.dts"

    goto/16 :goto_4c

    .line 814
    :cond_da
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_dtsh:I

    move/from16 v0, p1

    if-eq v0, v4, :cond_e6

    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_dtsl:I

    move/from16 v0, p1

    if-ne v0, v4, :cond_ea

    .line 815
    :cond_e6
    const-string v5, "audio/vnd.dts.hd"

    goto/16 :goto_4c

    .line 816
    :cond_ea
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_dtse:I

    move/from16 v0, p1

    if-ne v0, v4, :cond_f4

    .line 817
    const-string v5, "audio/vnd.dts.hd;profile=lbr"

    goto/16 :goto_4c

    .line 818
    :cond_f4
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_samr:I

    move/from16 v0, p1

    if-ne v0, v4, :cond_fe

    .line 819
    const-string v5, "audio/3gpp"

    goto/16 :goto_4c

    .line 820
    :cond_fe
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_sawb:I

    move/from16 v0, p1

    if-ne v0, v4, :cond_4c

    .line 821
    const-string v5, "audio/amr-wb"

    goto/16 :goto_4c

    .line 829
    .restart local v15    # "childAtomPosition":I
    .restart local v16    # "childAtomSize":I
    .restart local v19    # "initializationData":[B
    :cond_108
    const/4 v4, 0x0

    goto/16 :goto_64

    .line 835
    .restart local v17    # "childAtomType":I
    .restart local v18    # "esdsAtomPosition":I
    :cond_10b
    if-eqz p8, :cond_83

    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_wave:I

    move/from16 v0, v17

    if-ne v0, v4, :cond_83

    .line 836
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-static {v0, v15, v1}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->findEsdsPosition(Lcom/google/android/exoplayer/util/ParsableByteArray;II)I

    move-result v18

    goto/16 :goto_83

    .line 851
    :cond_11d
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_sinf:I

    move/from16 v0, v17

    if-ne v0, v4, :cond_ba

    .line 852
    move-object/from16 v0, p9

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;->trackEncryptionBoxes:[Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-static {v0, v15, v1}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseSinfFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;II)Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;

    move-result-object v6

    aput-object v6, v4, p10

    goto :goto_ba

    .line 855
    .end local v18    # "esdsAtomPosition":I
    :cond_132
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_ac_3:I

    move/from16 v0, p1

    if-ne v0, v4, :cond_158

    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_dac3:I

    move/from16 v0, v17

    if-ne v0, v4, :cond_158

    .line 858
    add-int/lit8 v4, v15, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 859
    invoke-static/range {p4 .. p4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    move-wide/from16 v1, p5

    move-object/from16 v3, p7

    invoke-static {v0, v4, v1, v2, v3}, Lcom/google/android/exoplayer/util/Ac3Util;->parseAc3AnnexFFormat(Lcom/google/android/exoplayer/util/ParsableByteArray;Ljava/lang/String;JLjava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v4

    move-object/from16 v0, p9

    iput-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    .line 887
    .end local v7    # "sampleSize":I
    .end local v16    # "childAtomSize":I
    .end local v17    # "childAtomType":I
    :cond_157
    :goto_157
    return-void

    .line 862
    .restart local v7    # "sampleSize":I
    .restart local v16    # "childAtomSize":I
    .restart local v17    # "childAtomType":I
    :cond_158
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_ec_3:I

    move/from16 v0, p1

    if-ne v0, v4, :cond_17e

    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_dec3:I

    move/from16 v0, v17

    if-ne v0, v4, :cond_17e

    .line 863
    add-int/lit8 v4, v15, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 864
    invoke-static/range {p4 .. p4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    move-wide/from16 v1, p5

    move-object/from16 v3, p7

    invoke-static {v0, v4, v1, v2, v3}, Lcom/google/android/exoplayer/util/Ac3Util;->parseEAc3AnnexFFormat(Lcom/google/android/exoplayer/util/ParsableByteArray;Ljava/lang/String;JLjava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v4

    move-object/from16 v0, p9

    iput-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    goto :goto_157

    .line 867
    :cond_17e
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_dtsc:I

    move/from16 v0, p1

    if-eq v0, v4, :cond_196

    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_dtse:I

    move/from16 v0, p1

    if-eq v0, v4, :cond_196

    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_dtsh:I

    move/from16 v0, p1

    if-eq v0, v4, :cond_196

    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_dtsl:I

    move/from16 v0, p1

    if-ne v0, v4, :cond_ba

    :cond_196
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_ddts:I

    move/from16 v0, v17

    if-ne v0, v4, :cond_ba

    .line 870
    invoke-static/range {p4 .. p4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v6, -0x1

    const/4 v7, -0x1

    const/4 v12, 0x0

    move-wide/from16 v8, p5

    move-object/from16 v13, p7

    invoke-static/range {v4 .. v13}, Lcom/google/android/exoplayer/MediaFormat;->createAudioFormat(Ljava/lang/String;Ljava/lang/String;IIJIILjava/util/List;Ljava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;

    .end local v7    # "sampleSize":I
    move-result-object v4

    move-object/from16 v0, p9

    iput-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    goto :goto_157

    .line 879
    .end local v16    # "childAtomSize":I
    .end local v17    # "childAtomType":I
    .restart local v7    # "sampleSize":I
    :cond_1b0
    if-eqz v5, :cond_157

    .line 883
    invoke-static/range {p4 .. p4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v6, -0x1

    if-nez v19, :cond_1c7

    const/4 v12, 0x0

    :goto_1ba
    move-wide/from16 v8, p5

    move-object/from16 v13, p7

    invoke-static/range {v4 .. v13}, Lcom/google/android/exoplayer/MediaFormat;->createAudioFormat(Ljava/lang/String;Ljava/lang/String;IIJIILjava/util/List;Ljava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v4

    move-object/from16 v0, p9

    iput-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    goto :goto_157

    :cond_1c7
    invoke-static/range {v19 .. v19}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v12

    goto :goto_1ba
.end method

.method private static parseAvcCFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$AvcCData;
    .registers 10
    .param p0, "parent"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "position"    # I

    .prologue
    .line 624
    add-int/lit8 v7, p1, 0x8

    add-int/lit8 v7, v7, 0x4

    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 626
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v7

    and-int/lit8 v7, v7, 0x3

    add-int/lit8 v2, v7, 0x1

    .line 627
    .local v2, "nalUnitLengthFieldLength":I
    const/4 v7, 0x3

    if-ne v2, v7, :cond_18

    .line 628
    new-instance v7, Ljava/lang/IllegalStateException;

    invoke-direct {v7}, Ljava/lang/IllegalStateException;-><init>()V

    throw v7

    .line 630
    :cond_18
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 631
    .local v0, "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    const/high16 v5, 0x3f800000    # 1.0f

    .line 632
    .local v5, "pixelWidthAspectRatio":F
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v7

    and-int/lit8 v4, v7, 0x1f

    .line 633
    .local v4, "numSequenceParameterSets":I
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_26
    if-ge v1, v4, :cond_32

    .line 634
    invoke-static {p0}, Lcom/google/android/exoplayer/util/NalUnitUtil;->parseChildNalUnit(Lcom/google/android/exoplayer/util/ParsableByteArray;)[B

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 633
    add-int/lit8 v1, v1, 0x1

    goto :goto_26

    .line 636
    :cond_32
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v3

    .line 637
    .local v3, "numPictureParameterSets":I
    const/4 v1, 0x0

    :goto_37
    if-ge v1, v3, :cond_43

    .line 638
    invoke-static {p0}, Lcom/google/android/exoplayer/util/NalUnitUtil;->parseChildNalUnit(Lcom/google/android/exoplayer/util/ParsableByteArray;)[B

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 637
    add-int/lit8 v1, v1, 0x1

    goto :goto_37

    .line 641
    :cond_43
    if-lez v4, :cond_5e

    .line 643
    new-instance v6, Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v7, 0x0

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [B

    invoke-direct {v6, v7}, Lcom/google/android/exoplayer/util/ParsableBitArray;-><init>([B)V

    .line 645
    .local v6, "spsDataBitArray":Lcom/google/android/exoplayer/util/ParsableBitArray;
    add-int/lit8 v7, v2, 0x1

    mul-int/lit8 v7, v7, 0x8

    invoke-virtual {v6, v7}, Lcom/google/android/exoplayer/util/ParsableBitArray;->setPosition(I)V

    .line 646
    invoke-static {v6}, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->parseSpsNalUnit(Lcom/google/android/exoplayer/util/ParsableBitArray;)Lcom/google/android/exoplayer/util/CodecSpecificDataUtil$SpsData;

    move-result-object v7

    iget v5, v7, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil$SpsData;->pixelWidthAspectRatio:F

    .line 650
    .end local v6    # "spsDataBitArray":Lcom/google/android/exoplayer/util/ParsableBitArray;
    :cond_5e
    new-instance v7, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$AvcCData;

    invoke-direct {v7, v0, v2, v5}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$AvcCData;-><init>(Ljava/util/List;IF)V

    return-object v7
.end method

.method private static parseEdts(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)Landroid/util/Pair;
    .registers 13
    .param p0, "edtsAtom"    # Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;",
            ")",
            "Landroid/util/Pair",
            "<[J[J>;"
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    const/4 v11, 0x1

    .line 704
    if-eqz p0, :cond_c

    sget v9, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_elst:I

    invoke-virtual {p0, v9}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v2

    .local v2, "elst":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    if-nez v2, :cond_11

    .line 705
    .end local v2    # "elst":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    :cond_c
    invoke-static {v10, v10}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v9

    .line 725
    :goto_10
    return-object v9

    .line 707
    .restart local v2    # "elst":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    :cond_11
    iget-object v3, v2, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 708
    .local v3, "elstData":Lcom/google/android/exoplayer/util/ParsableByteArray;
    const/16 v9, 0x8

    invoke-virtual {v3, v9}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 709
    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v5

    .line 710
    .local v5, "fullAtom":I
    invoke-static {v5}, Lcom/google/android/exoplayer/extractor/mp4/Atom;->parseFullAtomVersion(I)I

    move-result v8

    .line 711
    .local v8, "version":I
    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    .line 712
    .local v4, "entryCount":I
    new-array v0, v4, [J

    .line 713
    .local v0, "editListDurations":[J
    new-array v1, v4, [J

    .line 714
    .local v1, "editListMediaTimes":[J
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_29
    if-ge v6, v4, :cond_5b

    .line 715
    if-ne v8, v11, :cond_49

    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v9

    :goto_31
    aput-wide v9, v0, v6

    .line 717
    if-ne v8, v11, :cond_4e

    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readLong()J

    move-result-wide v9

    :goto_39
    aput-wide v9, v1, v6

    .line 718
    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readShort()S

    move-result v7

    .line 719
    .local v7, "mediaRateInteger":I
    if-eq v7, v11, :cond_54

    .line 721
    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "Unsupported media rate."

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 715
    .end local v7    # "mediaRateInteger":I
    :cond_49
    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v9

    goto :goto_31

    .line 717
    :cond_4e
    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v9

    int-to-long v9, v9

    goto :goto_39

    .line 723
    .restart local v7    # "mediaRateInteger":I
    :cond_54
    const/4 v9, 0x2

    invoke-virtual {v3, v9}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 714
    add-int/lit8 v6, v6, 0x1

    goto :goto_29

    .line 725
    .end local v7    # "mediaRateInteger":I
    :cond_5b
    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v9

    goto :goto_10
.end method

.method private static parseEsdsFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)Landroid/util/Pair;
    .registers 13
    .param p0, "parent"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/util/ParsableByteArray;",
            "I)",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "[B>;"
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    const/16 v9, 0x7f

    const/4 v8, 0x2

    const/4 v7, 0x1

    .line 907
    add-int/lit8 v6, p1, 0x8

    add-int/lit8 v6, v6, 0x4

    invoke-virtual {p0, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 909
    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 910
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v5

    .line 911
    .local v5, "varIntByte":I
    :goto_13
    if-le v5, v9, :cond_1a

    .line 912
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v5

    goto :goto_13

    .line 914
    :cond_1a
    invoke-virtual {p0, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 916
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v0

    .line 917
    .local v0, "flags":I
    and-int/lit16 v6, v0, 0x80

    if-eqz v6, :cond_28

    .line 918
    invoke-virtual {p0, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 920
    :cond_28
    and-int/lit8 v6, v0, 0x40

    if-eqz v6, :cond_33

    .line 921
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 923
    :cond_33
    and-int/lit8 v6, v0, 0x20

    if-eqz v6, :cond_3a

    .line 924
    invoke-virtual {p0, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 928
    :cond_3a
    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 929
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v5

    .line 930
    :goto_41
    if-le v5, v9, :cond_48

    .line 931
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v5

    goto :goto_41

    .line 935
    :cond_48
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v3

    .line 937
    .local v3, "objectTypeIndication":I
    sparse-switch v3, :sswitch_data_9c

    .line 971
    const/4 v2, 0x0

    .line 975
    .local v2, "mimeType":Ljava/lang/String;
    :goto_50
    const/16 v6, 0xc

    invoke-virtual {p0, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 978
    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 979
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v5

    .line 980
    and-int/lit8 v4, v5, 0x7f

    .line 981
    .local v4, "varInt":I
    :goto_5e
    if-le v5, v9, :cond_91

    .line 982
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v5

    .line 983
    shl-int/lit8 v4, v4, 0x8

    .line 984
    and-int/lit8 v6, v5, 0x7f

    or-int/2addr v4, v6

    goto :goto_5e

    .line 939
    .end local v2    # "mimeType":Ljava/lang/String;
    .end local v4    # "varInt":I
    :sswitch_6a
    const-string v2, "audio/mpeg"

    .line 940
    .restart local v2    # "mimeType":Ljava/lang/String;
    invoke-static {v2, v10}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v6

    .line 988
    :goto_70
    return-object v6

    .line 942
    .end local v2    # "mimeType":Ljava/lang/String;
    :sswitch_71
    const-string v2, "video/mp4v-es"

    .line 943
    .restart local v2    # "mimeType":Ljava/lang/String;
    goto :goto_50

    .line 945
    .end local v2    # "mimeType":Ljava/lang/String;
    :sswitch_74
    const-string v2, "video/avc"

    .line 946
    .restart local v2    # "mimeType":Ljava/lang/String;
    goto :goto_50

    .line 948
    .end local v2    # "mimeType":Ljava/lang/String;
    :sswitch_77
    const-string v2, "video/hevc"

    .line 949
    .restart local v2    # "mimeType":Ljava/lang/String;
    goto :goto_50

    .line 954
    .end local v2    # "mimeType":Ljava/lang/String;
    :sswitch_7a
    const-string v2, "audio/mp4a-latm"

    .line 955
    .restart local v2    # "mimeType":Ljava/lang/String;
    goto :goto_50

    .line 957
    .end local v2    # "mimeType":Ljava/lang/String;
    :sswitch_7d
    const-string v2, "audio/ac3"

    .line 958
    .restart local v2    # "mimeType":Ljava/lang/String;
    goto :goto_50

    .line 960
    .end local v2    # "mimeType":Ljava/lang/String;
    :sswitch_80
    const-string v2, "audio/eac3"

    .line 961
    .restart local v2    # "mimeType":Ljava/lang/String;
    goto :goto_50

    .line 964
    .end local v2    # "mimeType":Ljava/lang/String;
    :sswitch_83
    const-string v2, "audio/vnd.dts"

    .line 965
    .restart local v2    # "mimeType":Ljava/lang/String;
    invoke-static {v2, v10}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v6

    goto :goto_70

    .line 968
    .end local v2    # "mimeType":Ljava/lang/String;
    :sswitch_8a
    const-string v2, "audio/vnd.dts.hd"

    .line 969
    .restart local v2    # "mimeType":Ljava/lang/String;
    invoke-static {v2, v10}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v6

    goto :goto_70

    .line 986
    .restart local v4    # "varInt":I
    :cond_91
    new-array v1, v4, [B

    .line 987
    .local v1, "initializationData":[B
    const/4 v6, 0x0

    invoke-virtual {p0, v1, v6, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes([BII)V

    .line 988
    invoke-static {v2, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v6

    goto :goto_70

    .line 937
    :sswitch_data_9c
    .sparse-switch
        0x20 -> :sswitch_71
        0x21 -> :sswitch_74
        0x23 -> :sswitch_77
        0x40 -> :sswitch_7a
        0x66 -> :sswitch_7a
        0x67 -> :sswitch_7a
        0x68 -> :sswitch_7a
        0x6b -> :sswitch_6a
        0xa5 -> :sswitch_7d
        0xa6 -> :sswitch_80
        0xa9 -> :sswitch_83
        0xaa -> :sswitch_8a
        0xab -> :sswitch_8a
        0xac -> :sswitch_83
    .end sparse-switch
.end method

.method private static parseHdlr(Lcom/google/android/exoplayer/util/ParsableByteArray;)I
    .registers 2
    .param p0, "hdlr"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    .line 477
    const/16 v0, 0x10

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 478
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v0

    return v0
.end method

.method private static parseHvcCFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)Landroid/util/Pair;
    .registers 16
    .param p0, "parent"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/util/ParsableByteArray;",
            "I)",
            "Landroid/util/Pair",
            "<",
            "Ljava/util/List",
            "<[B>;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 656
    add-int/lit8 v11, p1, 0x8

    add-int/lit8 v11, v11, 0x15

    invoke-virtual {p0, v11}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 657
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v11

    and-int/lit8 v7, v11, 0x3

    .line 660
    .local v7, "lengthSizeMinusOne":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v9

    .line 661
    .local v9, "numberOfArrays":I
    const/4 v2, 0x0

    .line 662
    .local v2, "csdLength":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v3

    .line 663
    .local v3, "csdStartPosition":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_17
    if-ge v4, v9, :cond_34

    .line 664
    const/4 v11, 0x1

    invoke-virtual {p0, v11}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 665
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v10

    .line 666
    .local v10, "numberOfNalUnits":I
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_22
    if-ge v6, v10, :cond_31

    .line 667
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v8

    .line 668
    .local v8, "nalUnitLength":I
    add-int/lit8 v11, v8, 0x4

    add-int/2addr v2, v11

    .line 669
    invoke-virtual {p0, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 666
    add-int/lit8 v6, v6, 0x1

    goto :goto_22

    .line 663
    .end local v8    # "nalUnitLength":I
    :cond_31
    add-int/lit8 v4, v4, 0x1

    goto :goto_17

    .line 674
    .end local v6    # "j":I
    .end local v10    # "numberOfNalUnits":I
    :cond_34
    invoke-virtual {p0, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 675
    new-array v0, v2, [B

    .line 676
    .local v0, "buffer":[B
    const/4 v1, 0x0

    .line 677
    .local v1, "bufferPosition":I
    const/4 v4, 0x0

    :goto_3b
    if-ge v4, v9, :cond_6c

    .line 678
    const/4 v11, 0x1

    invoke-virtual {p0, v11}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 679
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v10

    .line 680
    .restart local v10    # "numberOfNalUnits":I
    const/4 v6, 0x0

    .restart local v6    # "j":I
    :goto_46
    if-ge v6, v10, :cond_69

    .line 681
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v8

    .line 682
    .restart local v8    # "nalUnitLength":I
    sget-object v11, Lcom/google/android/exoplayer/util/NalUnitUtil;->NAL_START_CODE:[B

    const/4 v12, 0x0

    sget-object v13, Lcom/google/android/exoplayer/util/NalUnitUtil;->NAL_START_CODE:[B

    array-length v13, v13

    invoke-static {v11, v12, v0, v1, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 684
    sget-object v11, Lcom/google/android/exoplayer/util/NalUnitUtil;->NAL_START_CODE:[B

    array-length v11, v11

    add-int/2addr v1, v11

    .line 685
    iget-object v11, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v12

    invoke-static {v11, v12, v0, v1, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 686
    add-int/2addr v1, v8

    .line 687
    invoke-virtual {p0, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 680
    add-int/lit8 v6, v6, 0x1

    goto :goto_46

    .line 677
    .end local v8    # "nalUnitLength":I
    :cond_69
    add-int/lit8 v4, v4, 0x1

    goto :goto_3b

    .line 691
    .end local v6    # "j":I
    .end local v10    # "numberOfNalUnits":I
    :cond_6c
    if-nez v2, :cond_7a

    const/4 v5, 0x0

    .line 692
    .local v5, "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    :goto_6f
    add-int/lit8 v11, v7, 0x1

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-static {v5, v11}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v11

    return-object v11

    .line 691
    .end local v5    # "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    :cond_7a
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    goto :goto_6f
.end method

.method private static parseIlst(Lcom/google/android/exoplayer/util/ParsableByteArray;)Lcom/google/android/exoplayer/extractor/GaplessInfo;
    .registers 11
    .param p0, "ilst"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    const/4 v9, 0x4

    .line 365
    :cond_1
    :goto_1
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v8

    if-lez v8, :cond_68

    .line 366
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v6

    .line 367
    .local v6, "position":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v8

    add-int v0, v6, v8

    .line 368
    .local v0, "endPosition":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v7

    .line 369
    .local v7, "type":I
    sget v8, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_DASHES:I

    if-ne v7, v8, :cond_64

    .line 370
    const/4 v3, 0x0

    .line 371
    .local v3, "lastCommentMean":Ljava/lang/String;
    const/4 v4, 0x0

    .line 372
    .local v4, "lastCommentName":Ljava/lang/String;
    const/4 v2, 0x0

    .line 373
    .local v2, "lastCommentData":Ljava/lang/String;
    :goto_1c
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v8

    if-ge v8, v0, :cond_53

    .line 374
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v8

    add-int/lit8 v5, v8, -0xc

    .line 375
    .local v5, "length":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v1

    .line 376
    .local v1, "key":I
    invoke-virtual {p0, v9}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 377
    sget v8, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mean:I

    if-ne v1, v8, :cond_38

    .line 378
    invoke-virtual {p0, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readString(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_1c

    .line 379
    :cond_38
    sget v8, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_name:I

    if-ne v1, v8, :cond_41

    .line 380
    invoke-virtual {p0, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readString(I)Ljava/lang/String;

    move-result-object v4

    goto :goto_1c

    .line 381
    :cond_41
    sget v8, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_data:I

    if-ne v1, v8, :cond_4f

    .line 382
    invoke-virtual {p0, v9}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 383
    add-int/lit8 v8, v5, -0x4

    invoke-virtual {p0, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_1c

    .line 385
    :cond_4f
    invoke-virtual {p0, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    goto :goto_1c

    .line 388
    .end local v1    # "key":I
    .end local v5    # "length":I
    :cond_53
    if-eqz v4, :cond_1

    if-eqz v2, :cond_1

    const-string v8, "com.apple.iTunes"

    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 390
    invoke-static {v4, v2}, Lcom/google/android/exoplayer/extractor/GaplessInfo;->createFromComment(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/exoplayer/extractor/GaplessInfo;

    move-result-object v8

    .line 396
    .end local v0    # "endPosition":I
    .end local v2    # "lastCommentData":Ljava/lang/String;
    .end local v3    # "lastCommentMean":Ljava/lang/String;
    .end local v4    # "lastCommentName":Ljava/lang/String;
    .end local v6    # "position":I
    .end local v7    # "type":I
    :goto_63
    return-object v8

    .line 393
    .restart local v0    # "endPosition":I
    .restart local v6    # "position":I
    .restart local v7    # "type":I
    :cond_64
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    goto :goto_1

    .line 396
    .end local v0    # "endPosition":I
    .end local v6    # "position":I
    .end local v7    # "type":I
    :cond_68
    const/4 v8, 0x0

    goto :goto_63
.end method

.method private static parseMdhd(Lcom/google/android/exoplayer/util/ParsableByteArray;)Landroid/util/Pair;
    .registers 9
    .param p0, "mdhd"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/util/ParsableByteArray;",
            ")",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v7, 0x8

    .line 489
    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 490
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v0

    .line 491
    .local v0, "fullAtom":I
    invoke-static {v0}, Lcom/google/android/exoplayer/extractor/mp4/Atom;->parseFullAtomVersion(I)I

    move-result v5

    .line 492
    .local v5, "version":I
    if-nez v5, :cond_58

    move v6, v7

    :goto_10
    invoke-virtual {p0, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 493
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v3

    .line 494
    .local v3, "timescale":J
    if-nez v5, :cond_1a

    const/4 v7, 0x4

    :cond_1a
    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 495
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v2

    .line 496
    .local v2, "languageCode":I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    shr-int/lit8 v7, v2, 0xa

    and-int/lit8 v7, v7, 0x1f

    add-int/lit8 v7, v7, 0x60

    int-to-char v7, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    shr-int/lit8 v7, v2, 0x5

    and-int/lit8 v7, v7, 0x1f

    add-int/lit8 v7, v7, 0x60

    int-to-char v7, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    and-int/lit8 v7, v2, 0x1f

    add-int/lit8 v7, v7, 0x60

    int-to-char v7, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 499
    .local v1, "language":Ljava/lang/String;
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-static {v6, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v6

    return-object v6

    .line 492
    .end local v1    # "language":Ljava/lang/String;
    .end local v2    # "languageCode":I
    .end local v3    # "timescale":J
    :cond_58
    const/16 v6, 0x10

    goto :goto_10
.end method

.method private static parseMvhd(Lcom/google/android/exoplayer/util/ParsableByteArray;)J
    .registers 5
    .param p0, "mvhd"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    const/16 v2, 0x8

    .line 406
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 408
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v0

    .line 409
    .local v0, "fullAtom":I
    invoke-static {v0}, Lcom/google/android/exoplayer/extractor/mp4/Atom;->parseFullAtomVersion(I)I

    move-result v1

    .line 411
    .local v1, "version":I
    if-nez v1, :cond_17

    :goto_f
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 413
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v2

    return-wide v2

    .line 411
    :cond_17
    const/16 v2, 0x10

    goto :goto_f
.end method

.method private static parsePaspFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)F
    .registers 6
    .param p0, "parent"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "position"    # I

    .prologue
    .line 753
    add-int/lit8 v2, p1, 0x8

    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 754
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v0

    .line 755
    .local v0, "hSpacing":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v1

    .line 756
    .local v1, "vSpacing":I
    int-to-float v2, v0

    int-to-float v3, v1

    div-float/2addr v2, v3

    return v2
.end method

.method private static parseSchiFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;II)Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;
    .registers 12
    .param p0, "parent"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "position"    # I
    .param p2, "size"    # I

    .prologue
    const/4 v4, 0x1

    const/4 v7, 0x0

    .line 761
    add-int/lit8 v2, p1, 0x8

    .line 762
    .local v2, "childPosition":I
    :goto_4
    sub-int v8, v2, p1

    if-ge v8, p2, :cond_37

    .line 763
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 764
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v0

    .line 765
    .local v0, "childAtomSize":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v1

    .line 766
    .local v1, "childAtomType":I
    sget v8, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_tenc:I

    if-ne v1, v8, :cond_35

    .line 767
    const/4 v8, 0x4

    invoke-virtual {p0, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 768
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v6

    .line 769
    .local v6, "firstInt":I
    shr-int/lit8 v8, v6, 0x8

    if-ne v8, v4, :cond_33

    .line 770
    .local v4, "defaultIsEncrypted":Z
    :goto_23
    and-int/lit16 v3, v6, 0xff

    .line 771
    .local v3, "defaultInitVectorSize":I
    const/16 v8, 0x10

    new-array v5, v8, [B

    .line 772
    .local v5, "defaultKeyId":[B
    array-length v8, v5

    invoke-virtual {p0, v5, v7, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes([BII)V

    .line 773
    new-instance v7, Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;

    invoke-direct {v7, v4, v3, v5}, Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;-><init>(ZI[B)V

    .line 777
    .end local v0    # "childAtomSize":I
    .end local v1    # "childAtomType":I
    .end local v3    # "defaultInitVectorSize":I
    .end local v4    # "defaultIsEncrypted":Z
    .end local v5    # "defaultKeyId":[B
    .end local v6    # "firstInt":I
    :goto_32
    return-object v7

    .restart local v0    # "childAtomSize":I
    .restart local v1    # "childAtomType":I
    .restart local v6    # "firstInt":I
    :cond_33
    move v4, v7

    .line 769
    goto :goto_23

    .line 775
    .end local v6    # "firstInt":I
    :cond_35
    add-int/2addr v2, v0

    .line 776
    goto :goto_4

    .line 777
    .end local v0    # "childAtomSize":I
    .end local v1    # "childAtomType":I
    :cond_37
    const/4 v7, 0x0

    goto :goto_32
.end method

.method private static parseSinfFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;II)Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;
    .registers 8
    .param p0, "parent"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "position"    # I
    .param p2, "size"    # I

    .prologue
    .line 730
    add-int/lit8 v2, p1, 0x8

    .line 732
    .local v2, "childPosition":I
    const/4 v3, 0x0

    .line 733
    .local v3, "trackEncryptionBox":Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;
    :goto_3
    sub-int v4, v2, p1

    if-ge v4, p2, :cond_33

    .line 734
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 735
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v0

    .line 736
    .local v0, "childAtomSize":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v1

    .line 737
    .local v1, "childAtomType":I
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_frma:I

    if-ne v1, v4, :cond_1b

    .line 738
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    .line 746
    :cond_19
    :goto_19
    add-int/2addr v2, v0

    .line 747
    goto :goto_3

    .line 739
    :cond_1b
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_schm:I

    if-ne v1, v4, :cond_2a

    .line 740
    const/4 v4, 0x4

    invoke-virtual {p0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 741
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    .line 742
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    goto :goto_19

    .line 743
    :cond_2a
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_schi:I

    if-ne v1, v4, :cond_19

    .line 744
    invoke-static {p0, v2, v0}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseSchiFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;II)Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;

    move-result-object v3

    goto :goto_19

    .line 749
    .end local v0    # "childAtomSize":I
    .end local v1    # "childAtomType":I
    :cond_33
    return-object v3
.end method

.method public static parseStbl(Lcom/google/android/exoplayer/extractor/mp4/Track;Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;
    .registers 73
    .param p0, "track"    # Lcom/google/android/exoplayer/extractor/mp4/Track;
    .param p1, "stblAtom"    # Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    .prologue
    .line 88
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stsz:I

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v4

    iget-object v0, v4, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v63, v0

    .line 92
    .local v63, "stsz":Lcom/google/android/exoplayer/util/ParsableByteArray;
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stco:I

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v21

    .line 93
    .local v21, "chunkOffsetsAtom":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    if-nez v21, :cond_1e

    .line 94
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_co64:I

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v21

    .line 96
    :cond_1e
    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v20, v0

    .line 98
    .local v20, "chunkOffsets":Lcom/google/android/exoplayer/util/ParsableByteArray;
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stsc:I

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v4

    iget-object v0, v4, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v60, v0

    .line 100
    .local v60, "stsc":Lcom/google/android/exoplayer/util/ParsableByteArray;
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stts:I

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v4

    iget-object v0, v4, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v64, v0

    .line 102
    .local v64, "stts":Lcom/google/android/exoplayer/util/ParsableByteArray;
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stss:I

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v62

    .line 103
    .local v62, "stssAtom":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    if-eqz v62, :cond_84

    move-object/from16 v0, v62

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v61, v0

    .line 105
    .local v61, "stss":Lcom/google/android/exoplayer/util/ParsableByteArray;
    :goto_4c
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_ctts:I

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v25

    .line 106
    .local v25, "cttsAtom":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    if-eqz v25, :cond_87

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v24, v0

    .line 109
    .local v24, "ctts":Lcom/google/android/exoplayer/util/ParsableByteArray;
    :goto_5c
    const/16 v4, 0xc

    move-object/from16 v0, v63

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 110
    invoke-virtual/range {v63 .. v63}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v35

    .line 111
    .local v35, "fixedSampleSize":I
    invoke-virtual/range {v63 .. v63}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v56

    .line 113
    .local v56, "sampleCount":I
    move/from16 v0, v56

    new-array v5, v0, [J

    .line 114
    .local v5, "offsets":[J
    move/from16 v0, v56

    new-array v6, v0, [I

    .line 115
    .local v6, "sizes":[I
    const/4 v7, 0x0

    .line 116
    .local v7, "maximumSize":I
    move/from16 v0, v56

    new-array v8, v0, [J

    .line 117
    .local v8, "timestamps":[J
    move/from16 v0, v56

    new-array v9, v0, [I

    .line 118
    .local v9, "flags":[I
    if-nez v56, :cond_8a

    .line 119
    new-instance v4, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;

    invoke-direct/range {v4 .. v9}, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;-><init>([J[II[J[I)V

    .line 330
    :goto_83
    return-object v4

    .line 103
    .end local v5    # "offsets":[J
    .end local v6    # "sizes":[I
    .end local v7    # "maximumSize":I
    .end local v8    # "timestamps":[J
    .end local v9    # "flags":[I
    .end local v24    # "ctts":Lcom/google/android/exoplayer/util/ParsableByteArray;
    .end local v25    # "cttsAtom":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    .end local v35    # "fixedSampleSize":I
    .end local v56    # "sampleCount":I
    .end local v61    # "stss":Lcom/google/android/exoplayer/util/ParsableByteArray;
    :cond_84
    const/16 v61, 0x0

    goto :goto_4c

    .line 106
    .restart local v25    # "cttsAtom":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    .restart local v61    # "stss":Lcom/google/android/exoplayer/util/ParsableByteArray;
    :cond_87
    const/16 v24, 0x0

    goto :goto_5c

    .line 123
    .restart local v5    # "offsets":[J
    .restart local v6    # "sizes":[I
    .restart local v7    # "maximumSize":I
    .restart local v8    # "timestamps":[J
    .restart local v9    # "flags":[I
    .restart local v24    # "ctts":Lcom/google/android/exoplayer/util/ParsableByteArray;
    .restart local v35    # "fixedSampleSize":I
    .restart local v56    # "sampleCount":I
    :cond_8a
    const/16 v4, 0xc

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 124
    invoke-virtual/range {v20 .. v20}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v18

    .line 126
    .local v18, "chunkCount":I
    const/16 v4, 0xc

    move-object/from16 v0, v60

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 127
    invoke-virtual/range {v60 .. v60}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    add-int/lit8 v52, v4, -0x1

    .line 128
    .local v52, "remainingSamplesPerChunkChanges":I
    invoke-virtual/range {v60 .. v60}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v4

    const/4 v12, 0x1

    if-ne v4, v12, :cond_1ba

    const/4 v4, 0x1

    :goto_aa
    const-string v12, "stsc first chunk must be 1"

    invoke-static {v4, v12}, Lcom/google/android/exoplayer/util/Assertions;->checkState(ZLjava/lang/Object;)V

    .line 129
    invoke-virtual/range {v60 .. v60}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v58

    .line 130
    .local v58, "samplesPerChunk":I
    const/4 v4, 0x4

    move-object/from16 v0, v60

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 131
    const/16 v41, -0x1

    .line 132
    .local v41, "nextSamplesPerChunkChangeChunkIndex":I
    if-lez v52, :cond_c3

    .line 134
    invoke-virtual/range {v60 .. v60}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    add-int/lit8 v41, v4, -0x1

    .line 137
    :cond_c3
    const/16 v19, 0x0

    .line 138
    .local v19, "chunkIndex":I
    move/from16 v51, v58

    .line 141
    .local v51, "remainingSamplesInChunk":I
    const/16 v4, 0xc

    move-object/from16 v0, v64

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 142
    invoke-virtual/range {v64 .. v64}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    add-int/lit8 v54, v4, -0x1

    .line 143
    .local v54, "remainingTimestampDeltaChanges":I
    invoke-virtual/range {v64 .. v64}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v49

    .line 144
    .local v49, "remainingSamplesAtTimestampDelta":I
    invoke-virtual/range {v64 .. v64}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v67

    .line 147
    .local v67, "timestampDeltaInTimeUnits":I
    const/16 v50, 0x0

    .line 148
    .local v50, "remainingSamplesAtTimestampOffset":I
    const/16 v55, 0x0

    .line 149
    .local v55, "remainingTimestampOffsetChanges":I
    const/16 v68, 0x0

    .line 150
    .local v68, "timestampOffset":I
    if-eqz v24, :cond_f9

    .line 151
    const/16 v4, 0xc

    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 152
    invoke-virtual/range {v24 .. v24}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    add-int/lit8 v55, v4, -0x1

    .line 153
    invoke-virtual/range {v24 .. v24}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v50

    .line 159
    invoke-virtual/range {v24 .. v24}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v68

    .line 162
    :cond_f9
    const/16 v42, -0x1

    .line 163
    .local v42, "nextSynchronizationSampleIndex":I
    const/16 v53, 0x0

    .line 164
    .local v53, "remainingSynchronizationSamples":I
    if-eqz v61, :cond_110

    .line 165
    const/16 v4, 0xc

    move-object/from16 v0, v61

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 166
    invoke-virtual/range {v61 .. v61}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v53

    .line 167
    invoke-virtual/range {v61 .. v61}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    add-int/lit8 v42, v4, -0x1

    .line 172
    :cond_110
    move-object/from16 v0, v21

    iget v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->type:I

    sget v12, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stco:I

    if-ne v4, v12, :cond_1bd

    .line 173
    invoke-virtual/range {v20 .. v20}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v43

    .line 178
    .local v43, "offsetBytes":J
    :goto_11c
    const-wide/16 v69, 0x0

    .line 179
    .local v69, "timestampTimeUnits":J
    const/16 v36, 0x0

    .local v36, "i":I
    :goto_120
    move/from16 v0, v36

    move/from16 v1, v56

    if-ge v0, v1, :cond_1d5

    .line 180
    aput-wide v43, v5, v36

    .line 181
    if-nez v35, :cond_1c3

    invoke-virtual/range {v63 .. v63}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    :goto_12e
    aput v4, v6, v36

    .line 182
    aget v4, v6, v36

    if-le v4, v7, :cond_136

    .line 183
    aget v7, v6, v36

    .line 185
    :cond_136
    move/from16 v0, v68

    int-to-long v12, v0

    add-long v12, v12, v69

    aput-wide v12, v8, v36

    .line 188
    if-nez v61, :cond_1c7

    const/4 v4, 0x1

    :goto_140
    aput v4, v9, v36

    .line 189
    move/from16 v0, v36

    move/from16 v1, v42

    if-ne v0, v1, :cond_155

    .line 190
    const/4 v4, 0x1

    aput v4, v9, v36

    .line 191
    add-int/lit8 v53, v53, -0x1

    .line 192
    if-lez v53, :cond_155

    .line 193
    invoke-virtual/range {v61 .. v61}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    add-int/lit8 v42, v4, -0x1

    .line 198
    :cond_155
    move/from16 v0, v67

    int-to-long v12, v0

    add-long v69, v69, v12

    .line 199
    add-int/lit8 v49, v49, -0x1

    .line 200
    if-nez v49, :cond_16a

    if-lez v54, :cond_16a

    .line 201
    invoke-virtual/range {v64 .. v64}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v49

    .line 202
    invoke-virtual/range {v64 .. v64}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v67

    .line 203
    add-int/lit8 v54, v54, -0x1

    .line 207
    :cond_16a
    if-eqz v24, :cond_17c

    .line 208
    add-int/lit8 v50, v50, -0x1

    .line 209
    if-nez v50, :cond_17c

    if-lez v55, :cond_17c

    .line 210
    invoke-virtual/range {v24 .. v24}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v50

    .line 212
    invoke-virtual/range {v24 .. v24}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v68

    .line 213
    add-int/lit8 v55, v55, -0x1

    .line 218
    :cond_17c
    add-int/lit8 v51, v51, -0x1

    .line 219
    if-nez v51, :cond_1cf

    .line 220
    add-int/lit8 v19, v19, 0x1

    .line 221
    move/from16 v0, v19

    move/from16 v1, v18

    if-ge v0, v1, :cond_194

    .line 222
    move-object/from16 v0, v21

    iget v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->type:I

    sget v12, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stco:I

    if-ne v4, v12, :cond_1ca

    .line 223
    invoke-virtual/range {v20 .. v20}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v43

    .line 230
    :cond_194
    :goto_194
    move/from16 v0, v19

    move/from16 v1, v41

    if-ne v0, v1, :cond_1ae

    .line 231
    invoke-virtual/range {v60 .. v60}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v58

    .line 232
    const/4 v4, 0x4

    move-object/from16 v0, v60

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 233
    add-int/lit8 v52, v52, -0x1

    .line 234
    if-lez v52, :cond_1ae

    .line 235
    invoke-virtual/range {v60 .. v60}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    add-int/lit8 v41, v4, -0x1

    .line 240
    :cond_1ae
    move/from16 v0, v19

    move/from16 v1, v18

    if-ge v0, v1, :cond_1b6

    .line 241
    move/from16 v51, v58

    .line 179
    :cond_1b6
    :goto_1b6
    add-int/lit8 v36, v36, 0x1

    goto/16 :goto_120

    .line 128
    .end local v19    # "chunkIndex":I
    .end local v36    # "i":I
    .end local v41    # "nextSamplesPerChunkChangeChunkIndex":I
    .end local v42    # "nextSynchronizationSampleIndex":I
    .end local v43    # "offsetBytes":J
    .end local v49    # "remainingSamplesAtTimestampDelta":I
    .end local v50    # "remainingSamplesAtTimestampOffset":I
    .end local v51    # "remainingSamplesInChunk":I
    .end local v53    # "remainingSynchronizationSamples":I
    .end local v54    # "remainingTimestampDeltaChanges":I
    .end local v55    # "remainingTimestampOffsetChanges":I
    .end local v58    # "samplesPerChunk":I
    .end local v67    # "timestampDeltaInTimeUnits":I
    .end local v68    # "timestampOffset":I
    .end local v69    # "timestampTimeUnits":J
    :cond_1ba
    const/4 v4, 0x0

    goto/16 :goto_aa

    .line 175
    .restart local v19    # "chunkIndex":I
    .restart local v41    # "nextSamplesPerChunkChangeChunkIndex":I
    .restart local v42    # "nextSynchronizationSampleIndex":I
    .restart local v49    # "remainingSamplesAtTimestampDelta":I
    .restart local v50    # "remainingSamplesAtTimestampOffset":I
    .restart local v51    # "remainingSamplesInChunk":I
    .restart local v53    # "remainingSynchronizationSamples":I
    .restart local v54    # "remainingTimestampDeltaChanges":I
    .restart local v55    # "remainingTimestampOffsetChanges":I
    .restart local v58    # "samplesPerChunk":I
    .restart local v67    # "timestampDeltaInTimeUnits":I
    .restart local v68    # "timestampOffset":I
    :cond_1bd
    invoke-virtual/range {v20 .. v20}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v43

    .restart local v43    # "offsetBytes":J
    goto/16 :goto_11c

    .restart local v36    # "i":I
    .restart local v69    # "timestampTimeUnits":J
    :cond_1c3
    move/from16 v4, v35

    .line 181
    goto/16 :goto_12e

    .line 188
    :cond_1c7
    const/4 v4, 0x0

    goto/16 :goto_140

    .line 225
    :cond_1ca
    invoke-virtual/range {v20 .. v20}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v43

    goto :goto_194

    .line 245
    :cond_1cf
    aget v4, v6, v36

    int-to-long v12, v4

    add-long v43, v43, v12

    goto :goto_1b6

    .line 250
    :cond_1d5
    if-nez v53, :cond_20a

    const/4 v4, 0x1

    :goto_1d8
    invoke-static {v4}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 251
    if-nez v49, :cond_20c

    const/4 v4, 0x1

    :goto_1de
    invoke-static {v4}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 252
    if-nez v51, :cond_20e

    const/4 v4, 0x1

    :goto_1e4
    invoke-static {v4}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 253
    if-nez v54, :cond_210

    const/4 v4, 0x1

    :goto_1ea
    invoke-static {v4}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 254
    if-nez v55, :cond_212

    const/4 v4, 0x1

    :goto_1f0
    invoke-static {v4}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 256
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListDurations:[J

    if-nez v4, :cond_214

    .line 257
    const-wide/32 v12, 0xf4240

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->timescale:J

    invoke-static {v8, v12, v13, v14, v15}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestampsInPlace([JJJ)V

    .line 258
    new-instance v4, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;

    invoke-direct/range {v4 .. v9}, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;-><init>([J[II[J[I)V

    goto/16 :goto_83

    .line 250
    :cond_20a
    const/4 v4, 0x0

    goto :goto_1d8

    .line 251
    :cond_20c
    const/4 v4, 0x0

    goto :goto_1de

    .line 252
    :cond_20e
    const/4 v4, 0x0

    goto :goto_1e4

    .line 253
    :cond_210
    const/4 v4, 0x0

    goto :goto_1ea

    .line 254
    :cond_212
    const/4 v4, 0x0

    goto :goto_1f0

    .line 266
    :cond_214
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListDurations:[J

    array-length v4, v4

    const/4 v12, 0x1

    if-ne v4, v12, :cond_252

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListDurations:[J

    const/4 v12, 0x0

    aget-wide v12, v4, v12

    const-wide/16 v14, 0x0

    cmp-long v4, v12, v14

    if-nez v4, :cond_252

    .line 270
    const/16 v36, 0x0

    :goto_22b
    array-length v4, v8

    move/from16 v0, v36

    if-ge v0, v4, :cond_24b

    .line 271
    aget-wide v12, v8, v36

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListMediaTimes:[J

    const/4 v14, 0x0

    aget-wide v14, v4, v14

    sub-long v10, v12, v14

    const-wide/32 v12, 0xf4240

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->timescale:J

    invoke-static/range {v10 .. v15}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v12

    aput-wide v12, v8, v36

    .line 270
    add-int/lit8 v36, v36, 0x1

    goto :goto_22b

    .line 274
    :cond_24b
    new-instance v4, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;

    invoke-direct/range {v4 .. v9}, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;-><init>([J[II[J[I)V

    goto/16 :goto_83

    .line 278
    :cond_252
    const/16 v29, 0x0

    .line 279
    .local v29, "editedSampleCount":I
    const/16 v40, 0x0

    .line 280
    .local v40, "nextSampleIndex":I
    const/16 v22, 0x0

    .line 281
    .local v22, "copyMetadata":Z
    const/16 v36, 0x0

    :goto_25a
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListDurations:[J

    array-length v4, v4

    move/from16 v0, v36

    if-ge v0, v4, :cond_2a5

    .line 282
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListMediaTimes:[J

    aget-wide v38, v4, v36

    .line 283
    .local v38, "mediaTime":J
    const-wide/16 v12, -0x1

    cmp-long v4, v38, v12

    if-eqz v4, :cond_2a0

    .line 284
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListDurations:[J

    aget-wide v10, v4, v36

    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->timescale:J

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->movieTimescale:J

    invoke-static/range {v10 .. v15}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v10

    .line 286
    .local v10, "duration":J
    const/4 v4, 0x1

    const/4 v12, 0x1

    move-wide/from16 v0, v38

    invoke-static {v8, v0, v1, v4, v12}, Lcom/google/android/exoplayer/util/Util;->binarySearchCeil([JJZZ)I

    move-result v59

    .line 287
    .local v59, "startIndex":I
    add-long v12, v38, v10

    const/4 v4, 0x1

    const/4 v14, 0x0

    invoke-static {v8, v12, v13, v4, v14}, Lcom/google/android/exoplayer/util/Util;->binarySearchCeil([JJZZ)I

    move-result v32

    .line 288
    .local v32, "endIndex":I
    sub-int v4, v32, v59

    add-int v29, v29, v4

    .line 289
    move/from16 v0, v40

    move/from16 v1, v59

    if-eq v0, v1, :cond_2a3

    const/4 v4, 0x1

    :goto_29c
    or-int v22, v22, v4

    .line 290
    move/from16 v40, v32

    .line 281
    .end local v10    # "duration":J
    .end local v32    # "endIndex":I
    .end local v59    # "startIndex":I
    :cond_2a0
    add-int/lit8 v36, v36, 0x1

    goto :goto_25a

    .line 289
    .restart local v10    # "duration":J
    .restart local v32    # "endIndex":I
    .restart local v59    # "startIndex":I
    :cond_2a3
    const/4 v4, 0x0

    goto :goto_29c

    .line 293
    .end local v10    # "duration":J
    .end local v32    # "endIndex":I
    .end local v38    # "mediaTime":J
    .end local v59    # "startIndex":I
    :cond_2a5
    move/from16 v0, v29

    move/from16 v1, v56

    if-eq v0, v1, :cond_36f

    const/4 v4, 0x1

    :goto_2ac
    or-int v22, v22, v4

    .line 296
    if-eqz v22, :cond_372

    move/from16 v0, v29

    new-array v0, v0, [J

    move-object/from16 v28, v0

    .line 297
    .local v28, "editedOffsets":[J
    :goto_2b6
    if-eqz v22, :cond_376

    move/from16 v0, v29

    new-array v0, v0, [I

    move-object/from16 v30, v0

    .line 298
    .local v30, "editedSizes":[I
    :goto_2be
    if-eqz v22, :cond_37a

    const/16 v27, 0x0

    .line 299
    .local v27, "editedMaximumSize":I
    :goto_2c2
    if-eqz v22, :cond_37e

    move/from16 v0, v29

    new-array v0, v0, [I

    move-object/from16 v26, v0

    .line 300
    .local v26, "editedFlags":[I
    :goto_2ca
    move/from16 v0, v29

    new-array v0, v0, [J

    move-object/from16 v31, v0

    .line 301
    .local v31, "editedTimestamps":[J
    const-wide/16 v45, 0x0

    .line 302
    .local v45, "pts":J
    const/16 v57, 0x0

    .line 303
    .local v57, "sampleIndex":I
    const/16 v36, 0x0

    :goto_2d6
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListDurations:[J

    array-length v4, v4

    move/from16 v0, v36

    if-ge v0, v4, :cond_388

    .line 304
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListMediaTimes:[J

    aget-wide v38, v4, v36

    .line 305
    .restart local v38    # "mediaTime":J
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListDurations:[J

    aget-wide v10, v4, v36

    .line 306
    .restart local v10    # "duration":J
    const-wide/16 v12, -0x1

    cmp-long v4, v38, v12

    if-eqz v4, :cond_382

    .line 307
    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->timescale:J

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->movieTimescale:J

    invoke-static/range {v10 .. v15}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v12

    add-long v33, v38, v12

    .line 309
    .local v33, "endMediaTime":J
    const/4 v4, 0x1

    const/4 v12, 0x1

    move-wide/from16 v0, v38

    invoke-static {v8, v0, v1, v4, v12}, Lcom/google/android/exoplayer/util/Util;->binarySearchCeil([JJZZ)I

    move-result v59

    .line 310
    .restart local v59    # "startIndex":I
    const/4 v4, 0x1

    const/4 v12, 0x0

    move-wide/from16 v0, v33

    invoke-static {v8, v0, v1, v4, v12}, Lcom/google/android/exoplayer/util/Util;->binarySearchCeil([JJZZ)I

    move-result v32

    .line 311
    .restart local v32    # "endIndex":I
    if-eqz v22, :cond_334

    .line 312
    sub-int v23, v32, v59

    .line 313
    .local v23, "count":I
    move/from16 v0, v59

    move-object/from16 v1, v28

    move/from16 v2, v57

    move/from16 v3, v23

    invoke-static {v5, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 314
    move/from16 v0, v59

    move-object/from16 v1, v30

    move/from16 v2, v57

    move/from16 v3, v23

    invoke-static {v6, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 315
    move/from16 v0, v59

    move-object/from16 v1, v26

    move/from16 v2, v57

    move/from16 v3, v23

    invoke-static {v9, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 317
    .end local v23    # "count":I
    :cond_334
    move/from16 v37, v59

    .local v37, "j":I
    :goto_336
    move/from16 v0, v37

    move/from16 v1, v32

    if-ge v0, v1, :cond_382

    .line 318
    const-wide/32 v14, 0xf4240

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->movieTimescale:J

    move-wide/from16 v16, v0

    move-wide/from16 v12, v45

    invoke-static/range {v12 .. v17}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v47

    .line 319
    .local v47, "ptsUs":J
    aget-wide v12, v8, v37

    sub-long v12, v12, v38

    const-wide/32 v14, 0xf4240

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->timescale:J

    move-wide/from16 v16, v0

    invoke-static/range {v12 .. v17}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v65

    .line 321
    .local v65, "timeInSegmentUs":J
    add-long v12, v47, v65

    aput-wide v12, v31, v57

    .line 322
    if-eqz v22, :cond_36a

    aget v4, v30, v57

    move/from16 v0, v27

    if-le v4, v0, :cond_36a

    .line 323
    aget v27, v6, v37

    .line 325
    :cond_36a
    add-int/lit8 v57, v57, 0x1

    .line 317
    add-int/lit8 v37, v37, 0x1

    goto :goto_336

    .line 293
    .end local v10    # "duration":J
    .end local v26    # "editedFlags":[I
    .end local v27    # "editedMaximumSize":I
    .end local v28    # "editedOffsets":[J
    .end local v30    # "editedSizes":[I
    .end local v31    # "editedTimestamps":[J
    .end local v32    # "endIndex":I
    .end local v33    # "endMediaTime":J
    .end local v37    # "j":I
    .end local v38    # "mediaTime":J
    .end local v45    # "pts":J
    .end local v47    # "ptsUs":J
    .end local v57    # "sampleIndex":I
    .end local v59    # "startIndex":I
    .end local v65    # "timeInSegmentUs":J
    :cond_36f
    const/4 v4, 0x0

    goto/16 :goto_2ac

    :cond_372
    move-object/from16 v28, v5

    .line 296
    goto/16 :goto_2b6

    .restart local v28    # "editedOffsets":[J
    :cond_376
    move-object/from16 v30, v6

    .line 297
    goto/16 :goto_2be

    .restart local v30    # "editedSizes":[I
    :cond_37a
    move/from16 v27, v7

    .line 298
    goto/16 :goto_2c2

    .restart local v27    # "editedMaximumSize":I
    :cond_37e
    move-object/from16 v26, v9

    .line 299
    goto/16 :goto_2ca

    .line 328
    .restart local v10    # "duration":J
    .restart local v26    # "editedFlags":[I
    .restart local v31    # "editedTimestamps":[J
    .restart local v38    # "mediaTime":J
    .restart local v45    # "pts":J
    .restart local v57    # "sampleIndex":I
    :cond_382
    add-long v45, v45, v10

    .line 303
    add-int/lit8 v36, v36, 0x1

    goto/16 :goto_2d6

    .line 330
    .end local v10    # "duration":J
    .end local v38    # "mediaTime":J
    :cond_388
    new-instance v12, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;

    move-object/from16 v13, v28

    move-object/from16 v14, v30

    move/from16 v15, v27

    move-object/from16 v16, v31

    move-object/from16 v17, v26

    invoke-direct/range {v12 .. v17}, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;-><init>([J[II[J[I)V

    move-object v4, v12

    goto/16 :goto_83
.end method

.method private static parseStsd(Lcom/google/android/exoplayer/util/ParsableByteArray;IJILjava/lang/String;Z)Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;
    .registers 29
    .param p0, "stsd"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "trackId"    # I
    .param p2, "durationUs"    # J
    .param p4, "rotationDegrees"    # I
    .param p5, "language"    # Ljava/lang/String;
    .param p6, "isQuickTime"    # Z

    .prologue
    .line 515
    const/16 v1, 0xc

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 516
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v21

    .line 517
    .local v21, "numberOfEntries":I
    new-instance v8, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;

    move/from16 v0, v21

    invoke-direct {v8, v0}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;-><init>(I)V

    .line 518
    .local v8, "out":Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_13
    move/from16 v0, v21

    if-ge v9, v0, :cond_f6

    .line 519
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v2

    .line 520
    .local v2, "childStartPosition":I
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v3

    .line 521
    .local v3, "childAtomSize":I
    if-lez v3, :cond_5c

    const/4 v1, 0x1

    :goto_22
    const-string v4, "childAtomSize should be positive"

    invoke-static {v1, v4}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(ZLjava/lang/Object;)V

    .line 522
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v11

    .line 523
    .local v11, "childAtomType":I
    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_avc1:I

    if-eq v11, v1, :cond_47

    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_avc3:I

    if-eq v11, v1, :cond_47

    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_encv:I

    if-eq v11, v1, :cond_47

    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mp4v:I

    if-eq v11, v1, :cond_47

    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_hvc1:I

    if-eq v11, v1, :cond_47

    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_hev1:I

    if-eq v11, v1, :cond_47

    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_s263:I

    if-ne v11, v1, :cond_5e

    :cond_47
    move-object/from16 v1, p0

    move/from16 v4, p1

    move-wide/from16 v5, p2

    move/from16 v7, p4

    .line 527
    invoke-static/range {v1 .. v9}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseVideoSampleEntry(Lcom/google/android/exoplayer/util/ParsableByteArray;IIIJILcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;I)V

    .line 550
    :cond_52
    :goto_52
    add-int v1, v2, v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 518
    add-int/lit8 v9, v9, 0x1

    goto :goto_13

    .line 521
    .end local v11    # "childAtomType":I
    :cond_5c
    const/4 v1, 0x0

    goto :goto_22

    .line 529
    .restart local v11    # "childAtomType":I
    :cond_5e
    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mp4a:I

    if-eq v11, v1, :cond_86

    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_enca:I

    if-eq v11, v1, :cond_86

    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_ac_3:I

    if-eq v11, v1, :cond_86

    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_ec_3:I

    if-eq v11, v1, :cond_86

    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_dtsc:I

    if-eq v11, v1, :cond_86

    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_dtse:I

    if-eq v11, v1, :cond_86

    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_dtsh:I

    if-eq v11, v1, :cond_86

    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_dtsl:I

    if-eq v11, v1, :cond_86

    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_samr:I

    if-eq v11, v1, :cond_86

    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_sawb:I

    if-ne v11, v1, :cond_9a

    :cond_86
    move-object/from16 v10, p0

    move v12, v2

    move v13, v3

    move/from16 v14, p1

    move-wide/from16 v15, p2

    move-object/from16 v17, p5

    move/from16 v18, p6

    move-object/from16 v19, v8

    move/from16 v20, v9

    .line 534
    invoke-static/range {v10 .. v20}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseAudioSampleEntry(Lcom/google/android/exoplayer/util/ParsableByteArray;IIIIJLjava/lang/String;ZLcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;I)V

    goto :goto_52

    .line 536
    :cond_9a
    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_TTML:I

    if-ne v11, v1, :cond_b0

    .line 537
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v12

    const-string v13, "application/ttml+xml"

    const/4 v14, -0x1

    move-wide/from16 v15, p2

    move-object/from16 v17, p5

    invoke-static/range {v12 .. v17}, Lcom/google/android/exoplayer/MediaFormat;->createTextFormat(Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v1

    iput-object v1, v8, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    goto :goto_52

    .line 539
    :cond_b0
    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_tx3g:I

    if-ne v11, v1, :cond_c6

    .line 540
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v12

    const-string v13, "application/x-quicktime-tx3g"

    const/4 v14, -0x1

    move-wide/from16 v15, p2

    move-object/from16 v17, p5

    invoke-static/range {v12 .. v17}, Lcom/google/android/exoplayer/MediaFormat;->createTextFormat(Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v1

    iput-object v1, v8, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    goto :goto_52

    .line 542
    :cond_c6
    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_wvtt:I

    if-ne v11, v1, :cond_dd

    .line 543
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v12

    const-string v13, "application/x-mp4vtt"

    const/4 v14, -0x1

    move-wide/from16 v15, p2

    move-object/from16 v17, p5

    invoke-static/range {v12 .. v17}, Lcom/google/android/exoplayer/MediaFormat;->createTextFormat(Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v1

    iput-object v1, v8, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    goto/16 :goto_52

    .line 545
    :cond_dd
    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stpp:I

    if-ne v11, v1, :cond_52

    .line 546
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v12

    const-string v13, "application/ttml+xml"

    const/4 v14, -0x1

    const-wide/16 v18, 0x0

    move-wide/from16 v15, p2

    move-object/from16 v17, p5

    invoke-static/range {v12 .. v19}, Lcom/google/android/exoplayer/MediaFormat;->createTextFormat(Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;J)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v1

    iput-object v1, v8, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    goto/16 :goto_52

    .line 552
    .end local v2    # "childStartPosition":I
    .end local v3    # "childAtomSize":I
    .end local v11    # "childAtomType":I
    :cond_f6
    return-object v8
.end method

.method private static parseTkhd(Lcom/google/android/exoplayer/util/ParsableByteArray;)Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$TkhdData;
    .registers 20
    .param p0, "tkhd"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    .line 422
    const/16 v17, 0x8

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 423
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v12

    .line 424
    .local v12, "fullAtom":I
    invoke-static {v12}, Lcom/google/android/exoplayer/extractor/mp4/Atom;->parseFullAtomVersion(I)I

    move-result v16

    .line 426
    .local v16, "version":I
    if-nez v16, :cond_8b

    const/16 v17, 0x8

    :goto_15
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 427
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v15

    .line 429
    .local v15, "trackId":I
    const/16 v17, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 430
    const/4 v10, 0x1

    .line 431
    .local v10, "durationUnknown":Z
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v9

    .line 432
    .local v9, "durationPosition":I
    if-nez v16, :cond_8e

    const/4 v8, 0x4

    .line 433
    .local v8, "durationByteCount":I
    :goto_31
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_32
    if-ge v13, v8, :cond_47

    .line 434
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v17, v0

    add-int v18, v9, v13

    aget-byte v17, v17, v18

    const/16 v18, -0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_91

    .line 435
    const/4 v10, 0x0

    .line 440
    :cond_47
    if-eqz v10, :cond_94

    .line 441
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 442
    const-wide/16 v6, -0x1

    .line 447
    .local v6, "duration":J
    :goto_50
    const/16 v17, 0x10

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 448
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v2

    .line 449
    .local v2, "a00":I
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v3

    .line 450
    .local v3, "a01":I
    const/16 v17, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 451
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v4

    .line 452
    .local v4, "a10":I
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v5

    .line 455
    .local v5, "a11":I
    const/high16 v11, 0x10000

    .line 456
    .local v11, "fixedOne":I
    if-nez v2, :cond_a0

    if-ne v3, v11, :cond_a0

    neg-int v0, v11

    move/from16 v17, v0

    move/from16 v0, v17

    if-ne v4, v0, :cond_a0

    if-nez v5, :cond_a0

    .line 457
    const/16 v14, 0x5a

    .line 467
    .local v14, "rotationDegrees":I
    :goto_83
    new-instance v17, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$TkhdData;

    move-object/from16 v0, v17

    invoke-direct {v0, v15, v6, v7, v14}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$TkhdData;-><init>(IJI)V

    return-object v17

    .line 426
    .end local v2    # "a00":I
    .end local v3    # "a01":I
    .end local v4    # "a10":I
    .end local v5    # "a11":I
    .end local v6    # "duration":J
    .end local v8    # "durationByteCount":I
    .end local v9    # "durationPosition":I
    .end local v10    # "durationUnknown":Z
    .end local v11    # "fixedOne":I
    .end local v13    # "i":I
    .end local v14    # "rotationDegrees":I
    .end local v15    # "trackId":I
    :cond_8b
    const/16 v17, 0x10

    goto :goto_15

    .line 432
    .restart local v9    # "durationPosition":I
    .restart local v10    # "durationUnknown":Z
    .restart local v15    # "trackId":I
    :cond_8e
    const/16 v8, 0x8

    goto :goto_31

    .line 433
    .restart local v8    # "durationByteCount":I
    .restart local v13    # "i":I
    :cond_91
    add-int/lit8 v13, v13, 0x1

    goto :goto_32

    .line 444
    :cond_94
    if-nez v16, :cond_9b

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v6

    .restart local v6    # "duration":J
    :goto_9a
    goto :goto_50

    .end local v6    # "duration":J
    :cond_9b
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v6

    goto :goto_9a

    .line 458
    .restart local v2    # "a00":I
    .restart local v3    # "a01":I
    .restart local v4    # "a10":I
    .restart local v5    # "a11":I
    .restart local v6    # "duration":J
    .restart local v11    # "fixedOne":I
    :cond_a0
    if-nez v2, :cond_b0

    neg-int v0, v11

    move/from16 v17, v0

    move/from16 v0, v17

    if-ne v3, v0, :cond_b0

    if-ne v4, v11, :cond_b0

    if-nez v5, :cond_b0

    .line 459
    const/16 v14, 0x10e

    .restart local v14    # "rotationDegrees":I
    goto :goto_83

    .line 460
    .end local v14    # "rotationDegrees":I
    :cond_b0
    neg-int v0, v11

    move/from16 v17, v0

    move/from16 v0, v17

    if-ne v2, v0, :cond_c5

    if-nez v3, :cond_c5

    if-nez v4, :cond_c5

    neg-int v0, v11

    move/from16 v17, v0

    move/from16 v0, v17

    if-ne v5, v0, :cond_c5

    .line 461
    const/16 v14, 0xb4

    .restart local v14    # "rotationDegrees":I
    goto :goto_83

    .line 464
    .end local v14    # "rotationDegrees":I
    :cond_c5
    const/4 v14, 0x0

    .restart local v14    # "rotationDegrees":I
    goto :goto_83
.end method

.method public static parseTrak(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;Z)Lcom/google/android/exoplayer/extractor/mp4/Track;
    .registers 35
    .param p0, "trak"    # Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    .param p1, "mvhd"    # Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    .param p2, "isQuickTime"    # Z

    .prologue
    .line 50
    sget v3, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mdia:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getContainerAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    move-result-object v27

    .line 51
    .local v27, "mdia":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    sget v3, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_hdlr:I

    move-object/from16 v0, v27

    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v3

    iget-object v3, v3, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-static {v3}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseHdlr(Lcom/google/android/exoplayer/util/ParsableByteArray;)I

    move-result v31

    .line 52
    .local v31, "trackType":I
    sget v3, Lcom/google/android/exoplayer/extractor/mp4/Track;->TYPE_soun:I

    move/from16 v0, v31

    if-eq v0, v3, :cond_36

    sget v3, Lcom/google/android/exoplayer/extractor/mp4/Track;->TYPE_vide:I

    move/from16 v0, v31

    if-eq v0, v3, :cond_36

    sget v3, Lcom/google/android/exoplayer/extractor/mp4/Track;->TYPE_text:I

    move/from16 v0, v31

    if-eq v0, v3, :cond_36

    sget v3, Lcom/google/android/exoplayer/extractor/mp4/Track;->TYPE_sbtl:I

    move/from16 v0, v31

    if-eq v0, v3, :cond_36

    sget v3, Lcom/google/android/exoplayer/extractor/mp4/Track;->TYPE_subt:I

    move/from16 v0, v31

    if-eq v0, v3, :cond_36

    .line 54
    const/4 v11, 0x0

    .line 73
    :goto_35
    return-object v11

    .line 57
    :cond_36
    sget v3, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_tkhd:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v3

    iget-object v3, v3, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-static {v3}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseTkhd(Lcom/google/android/exoplayer/util/ParsableByteArray;)Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$TkhdData;

    move-result-object v30

    .line 58
    .local v30, "tkhdData":Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$TkhdData;
    # getter for: Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$TkhdData;->duration:J
    invoke-static/range {v30 .. v30}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$TkhdData;->access$000(Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$TkhdData;)J

    move-result-wide v1

    .line 59
    .local v1, "duration":J
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-static {v3}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseMvhd(Lcom/google/android/exoplayer/util/ParsableByteArray;)J

    move-result-wide v5

    .line 61
    .local v5, "movieTimescale":J
    const-wide/16 v3, -0x1

    cmp-long v3, v1, v3

    if-nez v3, :cond_a6

    .line 62
    const-wide/16 v9, -0x1

    .line 66
    .local v9, "durationUs":J
    :goto_58
    sget v3, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_minf:I

    move-object/from16 v0, v27

    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getContainerAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    move-result-object v3

    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stbl:I

    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getContainerAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    move-result-object v28

    .line 69
    .local v28, "stbl":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    sget v3, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mdhd:I

    move-object/from16 v0, v27

    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v3

    iget-object v3, v3, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-static {v3}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseMdhd(Lcom/google/android/exoplayer/util/ParsableByteArray;)Landroid/util/Pair;

    move-result-object v26

    .line 70
    .local v26, "mdhdData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Long;Ljava/lang/String;>;"
    sget v3, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stsd:I

    move-object/from16 v0, v28

    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v3

    iget-object v7, v3, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    # getter for: Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$TkhdData;->id:I
    invoke-static/range {v30 .. v30}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$TkhdData;->access$100(Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$TkhdData;)I

    move-result v8

    # getter for: Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$TkhdData;->rotationDegrees:I
    invoke-static/range {v30 .. v30}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$TkhdData;->access$200(Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$TkhdData;)I

    move-result v11

    move-object/from16 v0, v26

    iget-object v12, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v12, Ljava/lang/String;

    move/from16 v13, p2

    invoke-static/range {v7 .. v13}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseStsd(Lcom/google/android/exoplayer/util/ParsableByteArray;IJILjava/lang/String;Z)Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;

    move-result-object v29

    .line 72
    .local v29, "stsdData":Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;
    sget v3, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_edts:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getContainerAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseEdts(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)Landroid/util/Pair;

    move-result-object v25

    .line 73
    .local v25, "edtsData":Landroid/util/Pair;, "Landroid/util/Pair<[J[J>;"
    move-object/from16 v0, v29

    iget-object v3, v0, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    if-nez v3, :cond_ae

    const/4 v11, 0x0

    goto :goto_35

    .line 64
    .end local v9    # "durationUs":J
    .end local v25    # "edtsData":Landroid/util/Pair;, "Landroid/util/Pair<[J[J>;"
    .end local v26    # "mdhdData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Long;Ljava/lang/String;>;"
    .end local v28    # "stbl":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    .end local v29    # "stsdData":Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;
    :cond_a6
    const-wide/32 v3, 0xf4240

    invoke-static/range {v1 .. v6}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v9

    .restart local v9    # "durationUs":J
    goto :goto_58

    .line 73
    .restart local v25    # "edtsData":Landroid/util/Pair;, "Landroid/util/Pair<[J[J>;"
    .restart local v26    # "mdhdData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Long;Ljava/lang/String;>;"
    .restart local v28    # "stbl":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    .restart local v29    # "stsdData":Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;
    :cond_ae
    new-instance v11, Lcom/google/android/exoplayer/extractor/mp4/Track;

    # getter for: Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$TkhdData;->id:I
    invoke-static/range {v30 .. v30}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$TkhdData;->access$100(Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$TkhdData;)I

    move-result v12

    move-object/from16 v0, v26

    iget-object v3, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v14

    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    move-object/from16 v20, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;->trackEncryptionBoxes:[Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;

    move-object/from16 v21, v0

    move-object/from16 v0, v29

    iget v0, v0, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;->nalUnitLengthFieldLength:I

    move/from16 v22, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    move-object/from16 v23, v0

    check-cast v23, [J

    move-object/from16 v0, v25

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    move-object/from16 v24, v0

    check-cast v24, [J

    move/from16 v13, v31

    move-wide/from16 v16, v5

    move-wide/from16 v18, v9

    invoke-direct/range {v11 .. v24}, Lcom/google/android/exoplayer/extractor/mp4/Track;-><init>(IIJJJLcom/google/android/exoplayer/MediaFormat;[Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;I[J[J)V

    goto/16 :goto_35
.end method

.method public static parseUdta(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)Lcom/google/android/exoplayer/extractor/GaplessInfo;
    .registers 10
    .param p0, "udtaAtom"    # Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    .prologue
    const/4 v6, 0x0

    .line 341
    sget v7, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_meta:I

    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v4

    .line 342
    .local v4, "metaAtom":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    if-nez v4, :cond_b

    move-object v1, v6

    .line 361
    :cond_a
    :goto_a
    return-object v1

    .line 345
    :cond_b
    iget-object v0, v4, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 346
    .local v0, "data":Lcom/google/android/exoplayer/util/ParsableByteArray;
    const/16 v7, 0xc

    invoke-virtual {v0, v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 347
    new-instance v2, Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-direct {v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>()V

    .line 348
    .local v2, "ilst":Lcom/google/android/exoplayer/util/ParsableByteArray;
    :goto_17
    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v7

    if-lez v7, :cond_46

    .line 349
    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v7

    add-int/lit8 v3, v7, -0x8

    .line 350
    .local v3, "length":I
    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v5

    .line 351
    .local v5, "type":I
    sget v7, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_ilst:I

    if-ne v5, v7, :cond_42

    .line 352
    iget-object v7, v0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v8

    add-int/2addr v8, v3

    invoke-virtual {v2, v7, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->reset([BI)V

    .line 353
    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v7

    invoke-virtual {v2, v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 354
    invoke-static {v2}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseIlst(Lcom/google/android/exoplayer/util/ParsableByteArray;)Lcom/google/android/exoplayer/extractor/GaplessInfo;

    move-result-object v1

    .line 355
    .local v1, "gaplessInfo":Lcom/google/android/exoplayer/extractor/GaplessInfo;
    if-nez v1, :cond_a

    .line 359
    .end local v1    # "gaplessInfo":Lcom/google/android/exoplayer/extractor/GaplessInfo;
    :cond_42
    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    goto :goto_17

    .end local v3    # "length":I
    .end local v5    # "type":I
    :cond_46
    move-object v1, v6

    .line 361
    goto :goto_a
.end method

.method private static parseVideoSampleEntry(Lcom/google/android/exoplayer/util/ParsableByteArray;IIIJILcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;I)V
    .registers 30
    .param p0, "parent"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "position"    # I
    .param p2, "size"    # I
    .param p3, "trackId"    # I
    .param p4, "durationUs"    # J
    .param p6, "rotationDegrees"    # I
    .param p7, "out"    # Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;
    .param p8, "entryIndex"    # I

    .prologue
    .line 557
    add-int/lit8 v2, p1, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 559
    const/16 v2, 0x18

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 560
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v8

    .line 561
    .local v8, "width":I
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v9

    .line 562
    .local v9, "height":I
    const/16 v20, 0x0

    .line 563
    .local v20, "pixelWidthHeightRatioFromPasp":Z
    const/high16 v12, 0x3f800000    # 1.0f

    .line 564
    .local v12, "pixelWidthHeightRatio":F
    const/16 v2, 0x32

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 566
    const/4 v10, 0x0

    .line 567
    .local v10, "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v16

    .line 568
    .local v16, "childPosition":I
    const/4 v3, 0x0

    .line 569
    .local v3, "mimeType":Ljava/lang/String;
    :goto_27
    sub-int v2, v16, p1

    move/from16 v0, p2

    if-ge v2, v0, :cond_48

    .line 570
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 571
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v17

    .line 572
    .local v17, "childStartPosition":I
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v14

    .line 573
    .local v14, "childAtomSize":I
    if-nez v14, :cond_4b

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v2

    sub-int v2, v2, p1

    move/from16 v0, p2

    if-ne v2, v0, :cond_4b

    .line 614
    .end local v14    # "childAtomSize":I
    .end local v17    # "childStartPosition":I
    :cond_48
    if-nez v3, :cond_fe

    .line 621
    :goto_4a
    return-void

    .line 577
    .restart local v14    # "childAtomSize":I
    .restart local v17    # "childStartPosition":I
    :cond_4b
    if-lez v14, :cond_7a

    const/4 v2, 0x1

    :goto_4e
    const-string v4, "childAtomSize should be positive"

    invoke-static {v2, v4}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(ZLjava/lang/Object;)V

    .line 578
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v15

    .line 579
    .local v15, "childAtomType":I
    sget v2, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_avcC:I

    if-ne v15, v2, :cond_7e

    .line 580
    if-nez v3, :cond_7c

    const/4 v2, 0x1

    :goto_5e
    invoke-static {v2}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 581
    const-string v3, "video/avc"

    .line 582
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-static {v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseAvcCFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$AvcCData;

    move-result-object v13

    .line 583
    .local v13, "avcCData":Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$AvcCData;
    iget-object v10, v13, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$AvcCData;->initializationData:Ljava/util/List;

    .line 584
    iget v2, v13, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$AvcCData;->nalUnitLengthFieldLength:I

    move-object/from16 v0, p7

    iput v2, v0, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;->nalUnitLengthFieldLength:I

    .line 585
    if-nez v20, :cond_77

    .line 586
    iget v12, v13, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$AvcCData;->pixelWidthAspectRatio:F

    .line 610
    .end local v13    # "avcCData":Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$AvcCData;
    :cond_77
    :goto_77
    add-int v16, v16, v14

    .line 611
    goto :goto_27

    .line 577
    .end local v15    # "childAtomType":I
    :cond_7a
    const/4 v2, 0x0

    goto :goto_4e

    .line 580
    .restart local v15    # "childAtomType":I
    :cond_7c
    const/4 v2, 0x0

    goto :goto_5e

    .line 588
    :cond_7e
    sget v2, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_hvcC:I

    if-ne v15, v2, :cond_a9

    .line 589
    if-nez v3, :cond_a7

    const/4 v2, 0x1

    :goto_85
    invoke-static {v2}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 590
    const-string v3, "video/hevc"

    .line 591
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-static {v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseHvcCFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)Landroid/util/Pair;

    move-result-object v18

    .line 592
    .local v18, "hvcCData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/util/List<[B>;Ljava/lang/Integer;>;"
    move-object/from16 v0, v18

    iget-object v10, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .end local v10    # "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    check-cast v10, Ljava/util/List;

    .line 593
    .restart local v10    # "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    move-object/from16 v0, v18

    iget-object v2, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    move-object/from16 v0, p7

    iput v2, v0, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;->nalUnitLengthFieldLength:I

    goto :goto_77

    .line 589
    .end local v18    # "hvcCData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/util/List<[B>;Ljava/lang/Integer;>;"
    :cond_a7
    const/4 v2, 0x0

    goto :goto_85

    .line 594
    :cond_a9
    sget v2, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_d263:I

    if-ne v15, v2, :cond_b8

    .line 595
    if-nez v3, :cond_b6

    const/4 v2, 0x1

    :goto_b0
    invoke-static {v2}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 596
    const-string v3, "video/3gpp"

    goto :goto_77

    .line 595
    :cond_b6
    const/4 v2, 0x0

    goto :goto_b0

    .line 597
    :cond_b8
    sget v2, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_esds:I

    if-ne v15, v2, :cond_db

    .line 598
    if-nez v3, :cond_d9

    const/4 v2, 0x1

    :goto_bf
    invoke-static {v2}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 599
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-static {v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseEsdsFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)Landroid/util/Pair;

    move-result-object v19

    .line 601
    .local v19, "mimeTypeAndInitializationData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;[B>;"
    move-object/from16 v0, v19

    iget-object v3, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .end local v3    # "mimeType":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 602
    .restart local v3    # "mimeType":Ljava/lang/String;
    move-object/from16 v0, v19

    iget-object v2, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    .line 603
    goto :goto_77

    .line 598
    .end local v19    # "mimeTypeAndInitializationData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;[B>;"
    :cond_d9
    const/4 v2, 0x0

    goto :goto_bf

    .line 603
    :cond_db
    sget v2, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_sinf:I

    if-ne v15, v2, :cond_ee

    .line 604
    move-object/from16 v0, p7

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;->trackEncryptionBoxes:[Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-static {v0, v1, v14}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseSinfFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;II)Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;

    move-result-object v4

    aput-object v4, v2, p8

    goto :goto_77

    .line 606
    :cond_ee
    sget v2, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_pasp:I

    if-ne v15, v2, :cond_77

    .line 607
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-static {v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parsePaspFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)F

    move-result v12

    .line 608
    const/16 v20, 0x1

    goto/16 :goto_77

    .line 618
    .end local v14    # "childAtomSize":I
    .end local v15    # "childAtomType":I
    .end local v17    # "childStartPosition":I
    :cond_fe
    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v4, -0x1

    const/4 v5, -0x1

    move-wide/from16 v6, p4

    move/from16 v11, p6

    invoke-static/range {v2 .. v12}, Lcom/google/android/exoplayer/MediaFormat;->createVideoFormat(Ljava/lang/String;Ljava/lang/String;IIJIILjava/util/List;IF)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v2

    move-object/from16 v0, p7

    iput-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    goto/16 :goto_4a
.end method
