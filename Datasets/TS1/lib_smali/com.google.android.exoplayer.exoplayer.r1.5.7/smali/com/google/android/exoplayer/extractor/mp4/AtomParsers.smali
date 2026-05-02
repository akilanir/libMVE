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
    .line 1016
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1018
    return-void
.end method

.method private static findEsdsPosition(Lcom/google/android/exoplayer/util/ParsableByteArray;II)I
    .registers 8
    .param p0, "parent"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "position"    # I
    .param p2, "size"    # I

    .prologue
    .line 917
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v0

    .line 918
    .local v0, "childAtomPosition":I
    :goto_4
    sub-int v3, v0, p1

    if-ge v3, p2, :cond_24

    .line 919
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 920
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v1

    .line 921
    .local v1, "childAtomSize":I
    if-lez v1, :cond_20

    const/4 v3, 0x1

    :goto_12
    const-string v4, "childAtomSize should be positive"

    invoke-static {v3, v4}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(ZLjava/lang/Object;)V

    .line 922
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v2

    .line 923
    .local v2, "childType":I
    sget v3, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_esds:I

    if-ne v2, v3, :cond_22

    .line 928
    .end local v0    # "childAtomPosition":I
    .end local v1    # "childAtomSize":I
    .end local v2    # "childType":I
    :goto_1f
    return v0

    .line 921
    .restart local v0    # "childAtomPosition":I
    .restart local v1    # "childAtomSize":I
    :cond_20
    const/4 v3, 0x0

    goto :goto_12

    .line 926
    .restart local v2    # "childType":I
    :cond_22
    add-int/2addr v0, v1

    .line 927
    goto :goto_4

    .line 928
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
    .line 809
    add-int/lit8 v4, p2, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 811
    const/16 v21, 0x0

    .line 812
    .local v21, "quickTimeSoundDescriptionVersion":I
    if-eqz p8, :cond_bd

    .line 813
    const/16 v4, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 814
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v21

    .line 815
    const/4 v4, 0x6

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 820
    :goto_1c
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v10

    .line 821
    .local v10, "channelCount":I
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v7

    .line 822
    .local v7, "sampleSize":I
    const/4 v4, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 823
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedFixedPoint1616()I

    move-result v11

    .line 825
    .local v11, "sampleRate":I
    if-lez v21, :cond_43

    .line 826
    const/16 v4, 0x10

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 827
    const/4 v4, 0x2

    move/from16 v0, v21

    if-ne v0, v4, :cond_43

    .line 828
    const/16 v4, 0x14

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 833
    :cond_43
    const/4 v5, 0x0

    .line 834
    .local v5, "mimeType":Ljava/lang/String;
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_ac_3:I

    move/from16 v0, p1

    if-ne v0, v4, :cond_c6

    .line 835
    const-string v5, "audio/ac3"

    .line 850
    :cond_4c
    :goto_4c
    const/16 v19, 0x0

    .line 851
    .local v19, "initializationData":[B
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v15

    .line 852
    .local v15, "childAtomPosition":I
    :goto_52
    sub-int v4, v15, p2

    move/from16 v0, p3

    if-ge v4, v0, :cond_1b0

    .line 853
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 854
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v16

    .line 855
    .local v16, "childAtomSize":I
    if-lez v16, :cond_108

    const/4 v4, 0x1

    :goto_64
    const-string v6, "childAtomSize should be positive"

    invoke-static {v4, v6}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(ZLjava/lang/Object;)V

    .line 856
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v17

    .line 857
    .local v17, "childAtomType":I
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mp4a:I

    move/from16 v0, p1

    if-eq v0, v4, :cond_79

    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_enca:I

    move/from16 v0, p1

    if-ne v0, v4, :cond_132

    .line 858
    :cond_79
    const/16 v18, -0x1

    .line 859
    .local v18, "esdsAtomPosition":I
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_esds:I

    move/from16 v0, v17

    if-ne v0, v4, :cond_10b

    .line 860
    move/from16 v18, v15

    .line 864
    :cond_83
    :goto_83
    const/4 v4, -0x1

    move/from16 v0, v18

    if-eq v0, v4, :cond_11d

    .line 865
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-static {v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseEsdsFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)Landroid/util/Pair;

    move-result-object v20

    .line 867
    .local v20, "mimeTypeAndInitializationData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;[B>;"
    move-object/from16 v0, v20

    iget-object v5, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .end local v5    # "mimeType":Ljava/lang/String;
    check-cast v5, Ljava/lang/String;

    .line 868
    .restart local v5    # "mimeType":Ljava/lang/String;
    move-object/from16 v0, v20

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    move-object/from16 v19, v0

    .end local v19    # "initializationData":[B
    check-cast v19, [B

    .line 869
    .restart local v19    # "initializationData":[B
    const-string v4, "audio/mp4a-latm"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ba

    .line 872
    invoke-static/range {v19 .. v19}, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->parseAacAudioSpecificConfig([B)Landroid/util/Pair;

    move-result-object v14

    .line 874
    .local v14, "audioSpecificConfig":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    iget-object v4, v14, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v11

    .line 875
    iget-object v4, v14, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v10

    .line 901
    .end local v14    # "audioSpecificConfig":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .end local v18    # "esdsAtomPosition":I
    .end local v20    # "mimeTypeAndInitializationData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;[B>;"
    :cond_ba
    :goto_ba
    add-int v15, v15, v16

    .line 902
    goto :goto_52

    .line 817
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

    .line 836
    .restart local v5    # "mimeType":Ljava/lang/String;
    .restart local v7    # "sampleSize":I
    .restart local v10    # "channelCount":I
    .restart local v11    # "sampleRate":I
    :cond_c6
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_ec_3:I

    move/from16 v0, p1

    if-ne v0, v4, :cond_d0

    .line 837
    const-string v5, "audio/eac3"

    goto/16 :goto_4c

    .line 838
    :cond_d0
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_dtsc:I

    move/from16 v0, p1

    if-ne v0, v4, :cond_da

    .line 839
    const-string v5, "audio/vnd.dts"

    goto/16 :goto_4c

    .line 840
    :cond_da
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_dtsh:I

    move/from16 v0, p1

    if-eq v0, v4, :cond_e6

    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_dtsl:I

    move/from16 v0, p1

    if-ne v0, v4, :cond_ea

    .line 841
    :cond_e6
    const-string v5, "audio/vnd.dts.hd"

    goto/16 :goto_4c

    .line 842
    :cond_ea
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_dtse:I

    move/from16 v0, p1

    if-ne v0, v4, :cond_f4

    .line 843
    const-string v5, "audio/vnd.dts.hd;profile=lbr"

    goto/16 :goto_4c

    .line 844
    :cond_f4
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_samr:I

    move/from16 v0, p1

    if-ne v0, v4, :cond_fe

    .line 845
    const-string v5, "audio/3gpp"

    goto/16 :goto_4c

    .line 846
    :cond_fe
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_sawb:I

    move/from16 v0, p1

    if-ne v0, v4, :cond_4c

    .line 847
    const-string v5, "audio/amr-wb"

    goto/16 :goto_4c

    .line 855
    .restart local v15    # "childAtomPosition":I
    .restart local v16    # "childAtomSize":I
    .restart local v19    # "initializationData":[B
    :cond_108
    const/4 v4, 0x0

    goto/16 :goto_64

    .line 861
    .restart local v17    # "childAtomType":I
    .restart local v18    # "esdsAtomPosition":I
    :cond_10b
    if-eqz p8, :cond_83

    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_wave:I

    move/from16 v0, v17

    if-ne v0, v4, :cond_83

    .line 862
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-static {v0, v15, v1}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->findEsdsPosition(Lcom/google/android/exoplayer/util/ParsableByteArray;II)I

    move-result v18

    goto/16 :goto_83

    .line 877
    :cond_11d
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_sinf:I

    move/from16 v0, v17

    if-ne v0, v4, :cond_ba

    .line 878
    move-object/from16 v0, p9

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;->trackEncryptionBoxes:[Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-static {v0, v15, v1}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseSinfFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;II)Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;

    move-result-object v6

    aput-object v6, v4, p10

    goto :goto_ba

    .line 881
    .end local v18    # "esdsAtomPosition":I
    :cond_132
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_ac_3:I

    move/from16 v0, p1

    if-ne v0, v4, :cond_158

    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_dac3:I

    move/from16 v0, v17

    if-ne v0, v4, :cond_158

    .line 884
    add-int/lit8 v4, v15, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 885
    invoke-static/range {p4 .. p4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    move-wide/from16 v1, p5

    move-object/from16 v3, p7

    invoke-static {v0, v4, v1, v2, v3}, Lcom/google/android/exoplayer/util/Ac3Util;->parseAc3AnnexFFormat(Lcom/google/android/exoplayer/util/ParsableByteArray;Ljava/lang/String;JLjava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v4

    move-object/from16 v0, p9

    iput-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    .line 913
    .end local v7    # "sampleSize":I
    .end local v16    # "childAtomSize":I
    .end local v17    # "childAtomType":I
    :cond_157
    :goto_157
    return-void

    .line 888
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

    .line 889
    add-int/lit8 v4, v15, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 890
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

    .line 893
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

    .line 896
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

    .line 905
    .end local v16    # "childAtomSize":I
    .end local v17    # "childAtomType":I
    .restart local v7    # "sampleSize":I
    :cond_1b0
    if-eqz v5, :cond_157

    .line 909
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
    .line 651
    add-int/lit8 v7, p1, 0x8

    add-int/lit8 v7, v7, 0x4

    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 653
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v7

    and-int/lit8 v7, v7, 0x3

    add-int/lit8 v2, v7, 0x1

    .line 654
    .local v2, "nalUnitLengthFieldLength":I
    const/4 v7, 0x3

    if-ne v2, v7, :cond_18

    .line 655
    new-instance v7, Ljava/lang/IllegalStateException;

    invoke-direct {v7}, Ljava/lang/IllegalStateException;-><init>()V

    throw v7

    .line 657
    :cond_18
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 658
    .local v0, "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    const/high16 v5, 0x3f800000    # 1.0f

    .line 659
    .local v5, "pixelWidthAspectRatio":F
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v7

    and-int/lit8 v4, v7, 0x1f

    .line 660
    .local v4, "numSequenceParameterSets":I
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_26
    if-ge v1, v4, :cond_32

    .line 661
    invoke-static {p0}, Lcom/google/android/exoplayer/util/NalUnitUtil;->parseChildNalUnit(Lcom/google/android/exoplayer/util/ParsableByteArray;)[B

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 660
    add-int/lit8 v1, v1, 0x1

    goto :goto_26

    .line 663
    :cond_32
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v3

    .line 664
    .local v3, "numPictureParameterSets":I
    const/4 v1, 0x0

    :goto_37
    if-ge v1, v3, :cond_43

    .line 665
    invoke-static {p0}, Lcom/google/android/exoplayer/util/NalUnitUtil;->parseChildNalUnit(Lcom/google/android/exoplayer/util/ParsableByteArray;)[B

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 664
    add-int/lit8 v1, v1, 0x1

    goto :goto_37

    .line 668
    :cond_43
    if-lez v4, :cond_5e

    .line 670
    new-instance v6, Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v7, 0x0

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [B

    invoke-direct {v6, v7}, Lcom/google/android/exoplayer/util/ParsableBitArray;-><init>([B)V

    .line 672
    .local v6, "spsDataBitArray":Lcom/google/android/exoplayer/util/ParsableBitArray;
    add-int/lit8 v7, v2, 0x1

    mul-int/lit8 v7, v7, 0x8

    invoke-virtual {v6, v7}, Lcom/google/android/exoplayer/util/ParsableBitArray;->setPosition(I)V

    .line 673
    invoke-static {v6}, Lcom/google/android/exoplayer/util/NalUnitUtil;->parseSpsNalUnit(Lcom/google/android/exoplayer/util/ParsableBitArray;)Lcom/google/android/exoplayer/util/NalUnitUtil$SpsData;

    move-result-object v7

    iget v5, v7, Lcom/google/android/exoplayer/util/NalUnitUtil$SpsData;->pixelWidthAspectRatio:F

    .line 676
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

    .line 730
    if-eqz p0, :cond_c

    sget v9, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_elst:I

    invoke-virtual {p0, v9}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v2

    .local v2, "elst":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    if-nez v2, :cond_11

    .line 731
    .end local v2    # "elst":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    :cond_c
    invoke-static {v10, v10}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v9

    .line 751
    :goto_10
    return-object v9

    .line 733
    .restart local v2    # "elst":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    :cond_11
    iget-object v3, v2, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 734
    .local v3, "elstData":Lcom/google/android/exoplayer/util/ParsableByteArray;
    const/16 v9, 0x8

    invoke-virtual {v3, v9}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 735
    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v5

    .line 736
    .local v5, "fullAtom":I
    invoke-static {v5}, Lcom/google/android/exoplayer/extractor/mp4/Atom;->parseFullAtomVersion(I)I

    move-result v8

    .line 737
    .local v8, "version":I
    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    .line 738
    .local v4, "entryCount":I
    new-array v0, v4, [J

    .line 739
    .local v0, "editListDurations":[J
    new-array v1, v4, [J

    .line 740
    .local v1, "editListMediaTimes":[J
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_29
    if-ge v6, v4, :cond_5b

    .line 741
    if-ne v8, v11, :cond_49

    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v9

    :goto_31
    aput-wide v9, v0, v6

    .line 743
    if-ne v8, v11, :cond_4e

    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readLong()J

    move-result-wide v9

    :goto_39
    aput-wide v9, v1, v6

    .line 744
    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readShort()S

    move-result v7

    .line 745
    .local v7, "mediaRateInteger":I
    if-eq v7, v11, :cond_54

    .line 747
    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "Unsupported media rate."

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 741
    .end local v7    # "mediaRateInteger":I
    :cond_49
    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v9

    goto :goto_31

    .line 743
    :cond_4e
    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v9

    int-to-long v9, v9

    goto :goto_39

    .line 749
    .restart local v7    # "mediaRateInteger":I
    :cond_54
    const/4 v9, 0x2

    invoke-virtual {v3, v9}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 740
    add-int/lit8 v6, v6, 0x1

    goto :goto_29

    .line 751
    .end local v7    # "mediaRateInteger":I
    :cond_5b
    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v9

    goto :goto_10
.end method

.method private static parseEsdsFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)Landroid/util/Pair;
    .registers 11
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
    const/4 v8, 0x0

    const/4 v7, 0x2

    const/4 v6, 0x1

    .line 933
    add-int/lit8 v5, p1, 0x8

    add-int/lit8 v5, v5, 0x4

    invoke-virtual {p0, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 935
    invoke-virtual {p0, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 936
    invoke-static {p0}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseExpandableClassSize(Lcom/google/android/exoplayer/util/ParsableByteArray;)I

    .line 937
    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 939
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v0

    .line 940
    .local v0, "flags":I
    and-int/lit16 v5, v0, 0x80

    if-eqz v5, :cond_1e

    .line 941
    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 943
    :cond_1e
    and-int/lit8 v5, v0, 0x40

    if-eqz v5, :cond_29

    .line 944
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v5

    invoke-virtual {p0, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 946
    :cond_29
    and-int/lit8 v5, v0, 0x20

    if-eqz v5, :cond_30

    .line 947
    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 951
    :cond_30
    invoke-virtual {p0, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 952
    invoke-static {p0}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseExpandableClassSize(Lcom/google/android/exoplayer/util/ParsableByteArray;)I

    .line 955
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v4

    .line 957
    .local v4, "objectTypeIndication":I
    sparse-switch v4, :sswitch_data_7c

    .line 991
    const/4 v3, 0x0

    .line 995
    .local v3, "mimeType":Ljava/lang/String;
    :goto_3e
    const/16 v5, 0xc

    invoke-virtual {p0, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 998
    invoke-virtual {p0, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 999
    invoke-static {p0}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseExpandableClassSize(Lcom/google/android/exoplayer/util/ParsableByteArray;)I

    move-result v2

    .line 1000
    .local v2, "initializationDataSize":I
    new-array v1, v2, [B

    .line 1001
    .local v1, "initializationData":[B
    const/4 v5, 0x0

    invoke-virtual {p0, v1, v5, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes([BII)V

    .line 1002
    invoke-static {v3, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v5

    .end local v1    # "initializationData":[B
    .end local v2    # "initializationDataSize":I
    :goto_54
    return-object v5

    .line 959
    .end local v3    # "mimeType":Ljava/lang/String;
    :sswitch_55
    const-string v3, "audio/mpeg"

    .line 960
    .restart local v3    # "mimeType":Ljava/lang/String;
    invoke-static {v3, v8}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v5

    goto :goto_54

    .line 962
    .end local v3    # "mimeType":Ljava/lang/String;
    :sswitch_5c
    const-string v3, "video/mp4v-es"

    .line 963
    .restart local v3    # "mimeType":Ljava/lang/String;
    goto :goto_3e

    .line 965
    .end local v3    # "mimeType":Ljava/lang/String;
    :sswitch_5f
    const-string v3, "video/avc"

    .line 966
    .restart local v3    # "mimeType":Ljava/lang/String;
    goto :goto_3e

    .line 968
    .end local v3    # "mimeType":Ljava/lang/String;
    :sswitch_62
    const-string v3, "video/hevc"

    .line 969
    .restart local v3    # "mimeType":Ljava/lang/String;
    goto :goto_3e

    .line 974
    .end local v3    # "mimeType":Ljava/lang/String;
    :sswitch_65
    const-string v3, "audio/mp4a-latm"

    .line 975
    .restart local v3    # "mimeType":Ljava/lang/String;
    goto :goto_3e

    .line 977
    .end local v3    # "mimeType":Ljava/lang/String;
    :sswitch_68
    const-string v3, "audio/ac3"

    .line 978
    .restart local v3    # "mimeType":Ljava/lang/String;
    goto :goto_3e

    .line 980
    .end local v3    # "mimeType":Ljava/lang/String;
    :sswitch_6b
    const-string v3, "audio/eac3"

    .line 981
    .restart local v3    # "mimeType":Ljava/lang/String;
    goto :goto_3e

    .line 984
    .end local v3    # "mimeType":Ljava/lang/String;
    :sswitch_6e
    const-string v3, "audio/vnd.dts"

    .line 985
    .restart local v3    # "mimeType":Ljava/lang/String;
    invoke-static {v3, v8}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v5

    goto :goto_54

    .line 988
    .end local v3    # "mimeType":Ljava/lang/String;
    :sswitch_75
    const-string v3, "audio/vnd.dts.hd"

    .line 989
    .restart local v3    # "mimeType":Ljava/lang/String;
    invoke-static {v3, v8}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v5

    goto :goto_54

    .line 957
    :sswitch_data_7c
    .sparse-switch
        0x20 -> :sswitch_5c
        0x21 -> :sswitch_5f
        0x23 -> :sswitch_62
        0x40 -> :sswitch_65
        0x66 -> :sswitch_65
        0x67 -> :sswitch_65
        0x68 -> :sswitch_65
        0x6b -> :sswitch_55
        0xa5 -> :sswitch_68
        0xa6 -> :sswitch_6b
        0xa9 -> :sswitch_6e
        0xaa -> :sswitch_75
        0xab -> :sswitch_75
        0xac -> :sswitch_6e
    .end sparse-switch
.end method

.method private static parseExpandableClassSize(Lcom/google/android/exoplayer/util/ParsableByteArray;)I
    .registers 5
    .param p0, "data"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    .line 1007
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v0

    .line 1008
    .local v0, "currentByte":I
    and-int/lit8 v1, v0, 0x7f

    .line 1009
    .local v1, "size":I
    :goto_6
    and-int/lit16 v2, v0, 0x80

    const/16 v3, 0x80

    if-ne v2, v3, :cond_17

    .line 1010
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v0

    .line 1011
    shl-int/lit8 v2, v1, 0x7

    and-int/lit8 v3, v0, 0x7f

    or-int v1, v2, v3

    goto :goto_6

    .line 1013
    :cond_17
    return v1
.end method

.method private static parseHdlr(Lcom/google/android/exoplayer/util/ParsableByteArray;)I
    .registers 2
    .param p0, "hdlr"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    .line 504
    const/16 v0, 0x10

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 505
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
    .line 682
    add-int/lit8 v11, p1, 0x8

    add-int/lit8 v11, v11, 0x15

    invoke-virtual {p0, v11}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 683
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v11

    and-int/lit8 v7, v11, 0x3

    .line 686
    .local v7, "lengthSizeMinusOne":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v9

    .line 687
    .local v9, "numberOfArrays":I
    const/4 v2, 0x0

    .line 688
    .local v2, "csdLength":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v3

    .line 689
    .local v3, "csdStartPosition":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_17
    if-ge v4, v9, :cond_34

    .line 690
    const/4 v11, 0x1

    invoke-virtual {p0, v11}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 691
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v10

    .line 692
    .local v10, "numberOfNalUnits":I
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_22
    if-ge v6, v10, :cond_31

    .line 693
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v8

    .line 694
    .local v8, "nalUnitLength":I
    add-int/lit8 v11, v8, 0x4

    add-int/2addr v2, v11

    .line 695
    invoke-virtual {p0, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 692
    add-int/lit8 v6, v6, 0x1

    goto :goto_22

    .line 689
    .end local v8    # "nalUnitLength":I
    :cond_31
    add-int/lit8 v4, v4, 0x1

    goto :goto_17

    .line 700
    .end local v6    # "j":I
    .end local v10    # "numberOfNalUnits":I
    :cond_34
    invoke-virtual {p0, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 701
    new-array v0, v2, [B

    .line 702
    .local v0, "buffer":[B
    const/4 v1, 0x0

    .line 703
    .local v1, "bufferPosition":I
    const/4 v4, 0x0

    :goto_3b
    if-ge v4, v9, :cond_6c

    .line 704
    const/4 v11, 0x1

    invoke-virtual {p0, v11}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 705
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v10

    .line 706
    .restart local v10    # "numberOfNalUnits":I
    const/4 v6, 0x0

    .restart local v6    # "j":I
    :goto_46
    if-ge v6, v10, :cond_69

    .line 707
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v8

    .line 708
    .restart local v8    # "nalUnitLength":I
    sget-object v11, Lcom/google/android/exoplayer/util/NalUnitUtil;->NAL_START_CODE:[B

    const/4 v12, 0x0

    sget-object v13, Lcom/google/android/exoplayer/util/NalUnitUtil;->NAL_START_CODE:[B

    array-length v13, v13

    invoke-static {v11, v12, v0, v1, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 710
    sget-object v11, Lcom/google/android/exoplayer/util/NalUnitUtil;->NAL_START_CODE:[B

    array-length v11, v11

    add-int/2addr v1, v11

    .line 711
    iget-object v11, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v12

    invoke-static {v11, v12, v0, v1, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 712
    add-int/2addr v1, v8

    .line 713
    invoke-virtual {p0, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 706
    add-int/lit8 v6, v6, 0x1

    goto :goto_46

    .line 703
    .end local v8    # "nalUnitLength":I
    :cond_69
    add-int/lit8 v4, v4, 0x1

    goto :goto_3b

    .line 717
    .end local v6    # "j":I
    .end local v10    # "numberOfNalUnits":I
    :cond_6c
    if-nez v2, :cond_7a

    const/4 v5, 0x0

    .line 718
    .local v5, "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    :goto_6f
    add-int/lit8 v11, v7, 0x1

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-static {v5, v11}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v11

    return-object v11

    .line 717
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

    .line 392
    :cond_1
    :goto_1
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v8

    if-lez v8, :cond_68

    .line 393
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v6

    .line 394
    .local v6, "position":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v8

    add-int v0, v6, v8

    .line 395
    .local v0, "endPosition":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v7

    .line 396
    .local v7, "type":I
    sget v8, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_DASHES:I

    if-ne v7, v8, :cond_64

    .line 397
    const/4 v3, 0x0

    .line 398
    .local v3, "lastCommentMean":Ljava/lang/String;
    const/4 v4, 0x0

    .line 399
    .local v4, "lastCommentName":Ljava/lang/String;
    const/4 v2, 0x0

    .line 400
    .local v2, "lastCommentData":Ljava/lang/String;
    :goto_1c
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v8

    if-ge v8, v0, :cond_53

    .line 401
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v8

    add-int/lit8 v5, v8, -0xc

    .line 402
    .local v5, "length":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v1

    .line 403
    .local v1, "key":I
    invoke-virtual {p0, v9}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 404
    sget v8, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mean:I

    if-ne v1, v8, :cond_38

    .line 405
    invoke-virtual {p0, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readString(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_1c

    .line 406
    :cond_38
    sget v8, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_name:I

    if-ne v1, v8, :cond_41

    .line 407
    invoke-virtual {p0, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readString(I)Ljava/lang/String;

    move-result-object v4

    goto :goto_1c

    .line 408
    :cond_41
    sget v8, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_data:I

    if-ne v1, v8, :cond_4f

    .line 409
    invoke-virtual {p0, v9}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 410
    add-int/lit8 v8, v5, -0x4

    invoke-virtual {p0, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_1c

    .line 412
    :cond_4f
    invoke-virtual {p0, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    goto :goto_1c

    .line 415
    .end local v1    # "key":I
    .end local v5    # "length":I
    :cond_53
    if-eqz v4, :cond_1

    if-eqz v2, :cond_1

    const-string v8, "com.apple.iTunes"

    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 417
    invoke-static {v4, v2}, Lcom/google/android/exoplayer/extractor/GaplessInfo;->createFromComment(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/exoplayer/extractor/GaplessInfo;

    move-result-object v8

    .line 423
    .end local v0    # "endPosition":I
    .end local v2    # "lastCommentData":Ljava/lang/String;
    .end local v3    # "lastCommentMean":Ljava/lang/String;
    .end local v4    # "lastCommentName":Ljava/lang/String;
    .end local v6    # "position":I
    .end local v7    # "type":I
    :goto_63
    return-object v8

    .line 420
    .restart local v0    # "endPosition":I
    .restart local v6    # "position":I
    .restart local v7    # "type":I
    :cond_64
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    goto :goto_1

    .line 423
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

    .line 516
    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 517
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v0

    .line 518
    .local v0, "fullAtom":I
    invoke-static {v0}, Lcom/google/android/exoplayer/extractor/mp4/Atom;->parseFullAtomVersion(I)I

    move-result v5

    .line 519
    .local v5, "version":I
    if-nez v5, :cond_58

    move v6, v7

    :goto_10
    invoke-virtual {p0, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 520
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v3

    .line 521
    .local v3, "timescale":J
    if-nez v5, :cond_1a

    const/4 v7, 0x4

    :cond_1a
    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 522
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v2

    .line 523
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

    .line 526
    .local v1, "language":Ljava/lang/String;
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-static {v6, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v6

    return-object v6

    .line 519
    .end local v1    # "language":Ljava/lang/String;
    .end local v2    # "languageCode":I
    .end local v3    # "timescale":J
    :cond_58
    const/16 v6, 0x10

    goto :goto_10
.end method

.method private static parseMetaAtom(Lcom/google/android/exoplayer/util/ParsableByteArray;)Lcom/google/android/exoplayer/extractor/GaplessInfo;
    .registers 7
    .param p0, "data"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    .line 373
    const/16 v4, 0xc

    invoke-virtual {p0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 374
    new-instance v2, Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-direct {v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>()V

    .line 375
    .local v2, "ilst":Lcom/google/android/exoplayer/util/ParsableByteArray;
    :goto_a
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v4

    const/16 v5, 0x8

    if-lt v4, v5, :cond_3c

    .line 376
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v4

    add-int/lit8 v3, v4, -0x8

    .line 377
    .local v3, "payloadSize":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v0

    .line 378
    .local v0, "atomType":I
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_ilst:I

    if-ne v0, v4, :cond_38

    .line 379
    iget-object v4, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v5

    add-int/2addr v5, v3

    invoke-virtual {v2, v4, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->reset([BI)V

    .line 380
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v4

    invoke-virtual {v2, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 381
    invoke-static {v2}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseIlst(Lcom/google/android/exoplayer/util/ParsableByteArray;)Lcom/google/android/exoplayer/extractor/GaplessInfo;

    move-result-object v1

    .line 382
    .local v1, "gaplessInfo":Lcom/google/android/exoplayer/extractor/GaplessInfo;
    if-eqz v1, :cond_38

    .line 388
    .end local v0    # "atomType":I
    .end local v1    # "gaplessInfo":Lcom/google/android/exoplayer/extractor/GaplessInfo;
    .end local v3    # "payloadSize":I
    :goto_37
    return-object v1

    .line 386
    .restart local v0    # "atomType":I
    .restart local v3    # "payloadSize":I
    :cond_38
    invoke-virtual {p0, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    goto :goto_a

    .line 388
    .end local v0    # "atomType":I
    .end local v3    # "payloadSize":I
    :cond_3c
    const/4 v1, 0x0

    goto :goto_37
.end method

.method private static parseMvhd(Lcom/google/android/exoplayer/util/ParsableByteArray;)J
    .registers 5
    .param p0, "mvhd"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    const/16 v2, 0x8

    .line 433
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 435
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v0

    .line 436
    .local v0, "fullAtom":I
    invoke-static {v0}, Lcom/google/android/exoplayer/extractor/mp4/Atom;->parseFullAtomVersion(I)I

    move-result v1

    .line 438
    .local v1, "version":I
    if-nez v1, :cond_17

    :goto_f
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 440
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v2

    return-wide v2

    .line 438
    :cond_17
    const/16 v2, 0x10

    goto :goto_f
.end method

.method private static parsePaspFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)F
    .registers 6
    .param p0, "parent"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "position"    # I

    .prologue
    .line 779
    add-int/lit8 v2, p1, 0x8

    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 780
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v0

    .line 781
    .local v0, "hSpacing":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v1

    .line 782
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

    .line 787
    add-int/lit8 v2, p1, 0x8

    .line 788
    .local v2, "childPosition":I
    :goto_4
    sub-int v8, v2, p1

    if-ge v8, p2, :cond_37

    .line 789
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 790
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v0

    .line 791
    .local v0, "childAtomSize":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v1

    .line 792
    .local v1, "childAtomType":I
    sget v8, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_tenc:I

    if-ne v1, v8, :cond_35

    .line 793
    const/4 v8, 0x4

    invoke-virtual {p0, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 794
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v6

    .line 795
    .local v6, "firstInt":I
    shr-int/lit8 v8, v6, 0x8

    if-ne v8, v4, :cond_33

    .line 796
    .local v4, "defaultIsEncrypted":Z
    :goto_23
    and-int/lit16 v3, v6, 0xff

    .line 797
    .local v3, "defaultInitVectorSize":I
    const/16 v8, 0x10

    new-array v5, v8, [B

    .line 798
    .local v5, "defaultKeyId":[B
    array-length v8, v5

    invoke-virtual {p0, v5, v7, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes([BII)V

    .line 799
    new-instance v7, Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;

    invoke-direct {v7, v4, v3, v5}, Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;-><init>(ZI[B)V

    .line 803
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

    .line 795
    goto :goto_23

    .line 801
    .end local v6    # "firstInt":I
    :cond_35
    add-int/2addr v2, v0

    .line 802
    goto :goto_4

    .line 803
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
    .line 756
    add-int/lit8 v2, p1, 0x8

    .line 758
    .local v2, "childPosition":I
    const/4 v3, 0x0

    .line 759
    .local v3, "trackEncryptionBox":Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;
    :goto_3
    sub-int v4, v2, p1

    if-ge v4, p2, :cond_33

    .line 760
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 761
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v0

    .line 762
    .local v0, "childAtomSize":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v1

    .line 763
    .local v1, "childAtomType":I
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_frma:I

    if-ne v1, v4, :cond_1b

    .line 764
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    .line 772
    :cond_19
    :goto_19
    add-int/2addr v2, v0

    .line 773
    goto :goto_3

    .line 765
    :cond_1b
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_schm:I

    if-ne v1, v4, :cond_2a

    .line 766
    const/4 v4, 0x4

    invoke-virtual {p0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 767
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    .line 768
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    goto :goto_19

    .line 769
    :cond_2a
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_schi:I

    if-ne v1, v4, :cond_19

    .line 770
    invoke-static {p0, v2, v0}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseSchiFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;II)Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;

    move-result-object v3

    goto :goto_19

    .line 775
    .end local v0    # "childAtomSize":I
    .end local v1    # "childAtomType":I
    :cond_33
    return-object v3
.end method

.method public static parseStbl(Lcom/google/android/exoplayer/extractor/mp4/Track;Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;
    .registers 74
    .param p0, "track"    # Lcom/google/android/exoplayer/extractor/mp4/Track;
    .param p1, "stblAtom"    # Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 91
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stsz:I

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v4

    iget-object v0, v4, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v64, v0

    .line 95
    .local v64, "stsz":Lcom/google/android/exoplayer/util/ParsableByteArray;
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stco:I

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v21

    .line 96
    .local v21, "chunkOffsetsAtom":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    if-nez v21, :cond_1e

    .line 97
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_co64:I

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v21

    .line 99
    :cond_1e
    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v20, v0

    .line 101
    .local v20, "chunkOffsets":Lcom/google/android/exoplayer/util/ParsableByteArray;
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stsc:I

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v4

    iget-object v0, v4, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v61, v0

    .line 103
    .local v61, "stsc":Lcom/google/android/exoplayer/util/ParsableByteArray;
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stts:I

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v4

    iget-object v0, v4, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v65, v0

    .line 105
    .local v65, "stts":Lcom/google/android/exoplayer/util/ParsableByteArray;
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stss:I

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v63

    .line 106
    .local v63, "stssAtom":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    if-eqz v63, :cond_84

    move-object/from16 v0, v63

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v62, v0

    .line 108
    .local v62, "stss":Lcom/google/android/exoplayer/util/ParsableByteArray;
    :goto_4c
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_ctts:I

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v25

    .line 109
    .local v25, "cttsAtom":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    if-eqz v25, :cond_87

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v24, v0

    .line 112
    .local v24, "ctts":Lcom/google/android/exoplayer/util/ParsableByteArray;
    :goto_5c
    const/16 v4, 0xc

    move-object/from16 v0, v64

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 113
    invoke-virtual/range {v64 .. v64}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v35

    .line 114
    .local v35, "fixedSampleSize":I
    invoke-virtual/range {v64 .. v64}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v57

    .line 116
    .local v57, "sampleCount":I
    move/from16 v0, v57

    new-array v5, v0, [J

    .line 117
    .local v5, "offsets":[J
    move/from16 v0, v57

    new-array v6, v0, [I

    .line 118
    .local v6, "sizes":[I
    const/4 v7, 0x0

    .line 119
    .local v7, "maximumSize":I
    move/from16 v0, v57

    new-array v8, v0, [J

    .line 120
    .local v8, "timestamps":[J
    move/from16 v0, v57

    new-array v9, v0, [I

    .line 121
    .local v9, "flags":[I
    if-nez v57, :cond_8a

    .line 122
    new-instance v4, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;

    invoke-direct/range {v4 .. v9}, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;-><init>([J[II[J[I)V

    .line 339
    :goto_83
    return-object v4

    .line 106
    .end local v5    # "offsets":[J
    .end local v6    # "sizes":[I
    .end local v7    # "maximumSize":I
    .end local v8    # "timestamps":[J
    .end local v9    # "flags":[I
    .end local v24    # "ctts":Lcom/google/android/exoplayer/util/ParsableByteArray;
    .end local v25    # "cttsAtom":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    .end local v35    # "fixedSampleSize":I
    .end local v57    # "sampleCount":I
    .end local v62    # "stss":Lcom/google/android/exoplayer/util/ParsableByteArray;
    :cond_84
    const/16 v62, 0x0

    goto :goto_4c

    .line 109
    .restart local v25    # "cttsAtom":Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    .restart local v62    # "stss":Lcom/google/android/exoplayer/util/ParsableByteArray;
    :cond_87
    const/16 v24, 0x0

    goto :goto_5c

    .line 126
    .restart local v5    # "offsets":[J
    .restart local v6    # "sizes":[I
    .restart local v7    # "maximumSize":I
    .restart local v8    # "timestamps":[J
    .restart local v9    # "flags":[I
    .restart local v24    # "ctts":Lcom/google/android/exoplayer/util/ParsableByteArray;
    .restart local v35    # "fixedSampleSize":I
    .restart local v57    # "sampleCount":I
    :cond_8a
    const/16 v4, 0xc

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 127
    invoke-virtual/range {v20 .. v20}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v18

    .line 129
    .local v18, "chunkCount":I
    const/16 v4, 0xc

    move-object/from16 v0, v61

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 130
    invoke-virtual/range {v61 .. v61}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    add-int/lit8 v53, v4, -0x1

    .line 131
    .local v53, "remainingSamplesPerChunkChanges":I
    invoke-virtual/range {v61 .. v61}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v4

    const/4 v12, 0x1

    if-ne v4, v12, :cond_12d

    const/4 v4, 0x1

    :goto_aa
    const-string v12, "stsc first chunk must be 1"

    invoke-static {v4, v12}, Lcom/google/android/exoplayer/util/Assertions;->checkState(ZLjava/lang/Object;)V

    .line 132
    invoke-virtual/range {v61 .. v61}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v59

    .line 133
    .local v59, "samplesPerChunk":I
    const/4 v4, 0x4

    move-object/from16 v0, v61

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 134
    const/16 v42, -0x1

    .line 135
    .local v42, "nextSamplesPerChunkChangeChunkIndex":I
    if-lez v53, :cond_c3

    .line 137
    invoke-virtual/range {v61 .. v61}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    add-int/lit8 v42, v4, -0x1

    .line 140
    :cond_c3
    const/16 v19, 0x0

    .line 141
    .local v19, "chunkIndex":I
    move/from16 v52, v59

    .line 144
    .local v52, "remainingSamplesInChunk":I
    const/16 v4, 0xc

    move-object/from16 v0, v65

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 145
    invoke-virtual/range {v65 .. v65}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    add-int/lit8 v55, v4, -0x1

    .line 146
    .local v55, "remainingTimestampDeltaChanges":I
    invoke-virtual/range {v65 .. v65}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v50

    .line 147
    .local v50, "remainingSamplesAtTimestampDelta":I
    invoke-virtual/range {v65 .. v65}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v68

    .line 150
    .local v68, "timestampDeltaInTimeUnits":I
    const/16 v51, 0x0

    .line 151
    .local v51, "remainingSamplesAtTimestampOffset":I
    const/16 v56, 0x0

    .line 152
    .local v56, "remainingTimestampOffsetChanges":I
    const/16 v69, 0x0

    .line 153
    .local v69, "timestampOffset":I
    if-eqz v24, :cond_ef

    .line 154
    const/16 v4, 0xc

    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 155
    invoke-virtual/range {v24 .. v24}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v56

    .line 158
    :cond_ef
    const/16 v43, -0x1

    .line 159
    .local v43, "nextSynchronizationSampleIndex":I
    const/16 v54, 0x0

    .line 160
    .local v54, "remainingSynchronizationSamples":I
    if-eqz v62, :cond_106

    .line 161
    const/16 v4, 0xc

    move-object/from16 v0, v62

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 162
    invoke-virtual/range {v62 .. v62}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v54

    .line 163
    invoke-virtual/range {v62 .. v62}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    add-int/lit8 v43, v4, -0x1

    .line 168
    :cond_106
    move-object/from16 v0, v21

    iget v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->type:I

    sget v12, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stco:I

    if-ne v4, v12, :cond_130

    .line 169
    invoke-virtual/range {v20 .. v20}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v44

    .line 174
    .local v44, "offsetBytes":J
    :goto_112
    const-wide/16 v70, 0x0

    .line 175
    .local v70, "timestampTimeUnits":J
    const/16 v37, 0x0

    .local v37, "i":I
    :goto_116
    move/from16 v0, v37

    move/from16 v1, v57

    if-ge v0, v1, :cond_1c9

    .line 177
    if-eqz v24, :cond_137

    .line 178
    :goto_11e
    if-nez v51, :cond_135

    if-lez v56, :cond_135

    .line 179
    invoke-virtual/range {v24 .. v24}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v51

    .line 185
    invoke-virtual/range {v24 .. v24}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v69

    .line 186
    add-int/lit8 v56, v56, -0x1

    goto :goto_11e

    .line 131
    .end local v19    # "chunkIndex":I
    .end local v37    # "i":I
    .end local v42    # "nextSamplesPerChunkChangeChunkIndex":I
    .end local v43    # "nextSynchronizationSampleIndex":I
    .end local v44    # "offsetBytes":J
    .end local v50    # "remainingSamplesAtTimestampDelta":I
    .end local v51    # "remainingSamplesAtTimestampOffset":I
    .end local v52    # "remainingSamplesInChunk":I
    .end local v54    # "remainingSynchronizationSamples":I
    .end local v55    # "remainingTimestampDeltaChanges":I
    .end local v56    # "remainingTimestampOffsetChanges":I
    .end local v59    # "samplesPerChunk":I
    .end local v68    # "timestampDeltaInTimeUnits":I
    .end local v69    # "timestampOffset":I
    .end local v70    # "timestampTimeUnits":J
    :cond_12d
    const/4 v4, 0x0

    goto/16 :goto_aa

    .line 171
    .restart local v19    # "chunkIndex":I
    .restart local v42    # "nextSamplesPerChunkChangeChunkIndex":I
    .restart local v43    # "nextSynchronizationSampleIndex":I
    .restart local v50    # "remainingSamplesAtTimestampDelta":I
    .restart local v51    # "remainingSamplesAtTimestampOffset":I
    .restart local v52    # "remainingSamplesInChunk":I
    .restart local v54    # "remainingSynchronizationSamples":I
    .restart local v55    # "remainingTimestampDeltaChanges":I
    .restart local v56    # "remainingTimestampOffsetChanges":I
    .restart local v59    # "samplesPerChunk":I
    .restart local v68    # "timestampDeltaInTimeUnits":I
    .restart local v69    # "timestampOffset":I
    :cond_130
    invoke-virtual/range {v20 .. v20}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v44

    .restart local v44    # "offsetBytes":J
    goto :goto_112

    .line 188
    .restart local v37    # "i":I
    .restart local v70    # "timestampTimeUnits":J
    :cond_135
    add-int/lit8 v51, v51, -0x1

    .line 191
    :cond_137
    aput-wide v44, v5, v37

    .line 192
    if-nez v35, :cond_1b9

    invoke-virtual/range {v64 .. v64}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    :goto_13f
    aput v4, v6, v37

    .line 193
    aget v4, v6, v37

    if-le v4, v7, :cond_147

    .line 194
    aget v7, v6, v37

    .line 196
    :cond_147
    move/from16 v0, v69

    int-to-long v12, v0

    add-long v12, v12, v70

    aput-wide v12, v8, v37

    .line 199
    if-nez v62, :cond_1bc

    const/4 v4, 0x1

    :goto_151
    aput v4, v9, v37

    .line 200
    move/from16 v0, v37

    move/from16 v1, v43

    if-ne v0, v1, :cond_166

    .line 201
    const/4 v4, 0x1

    aput v4, v9, v37

    .line 202
    add-int/lit8 v54, v54, -0x1

    .line 203
    if-lez v54, :cond_166

    .line 204
    invoke-virtual/range {v62 .. v62}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    add-int/lit8 v43, v4, -0x1

    .line 209
    :cond_166
    move/from16 v0, v68

    int-to-long v12, v0

    add-long v70, v70, v12

    .line 210
    add-int/lit8 v50, v50, -0x1

    .line 211
    if-nez v50, :cond_17b

    if-lez v55, :cond_17b

    .line 212
    invoke-virtual/range {v65 .. v65}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v50

    .line 213
    invoke-virtual/range {v65 .. v65}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v68

    .line 214
    add-int/lit8 v55, v55, -0x1

    .line 218
    :cond_17b
    add-int/lit8 v52, v52, -0x1

    .line 219
    if-nez v52, :cond_1c3

    .line 220
    add-int/lit8 v19, v19, 0x1

    .line 221
    move/from16 v0, v19

    move/from16 v1, v18

    if-ge v0, v1, :cond_193

    .line 222
    move-object/from16 v0, v21

    iget v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->type:I

    sget v12, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stco:I

    if-ne v4, v12, :cond_1be

    .line 223
    invoke-virtual/range {v20 .. v20}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v44

    .line 230
    :cond_193
    :goto_193
    move/from16 v0, v19

    move/from16 v1, v42

    if-ne v0, v1, :cond_1ad

    .line 231
    invoke-virtual/range {v61 .. v61}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v59

    .line 232
    const/4 v4, 0x4

    move-object/from16 v0, v61

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 233
    add-int/lit8 v53, v53, -0x1

    .line 234
    if-lez v53, :cond_1ad

    .line 235
    invoke-virtual/range {v61 .. v61}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    add-int/lit8 v42, v4, -0x1

    .line 240
    :cond_1ad
    move/from16 v0, v19

    move/from16 v1, v18

    if-ge v0, v1, :cond_1b5

    .line 241
    move/from16 v52, v59

    .line 175
    :cond_1b5
    :goto_1b5
    add-int/lit8 v37, v37, 0x1

    goto/16 :goto_116

    :cond_1b9
    move/from16 v4, v35

    .line 192
    goto :goto_13f

    .line 199
    :cond_1bc
    const/4 v4, 0x0

    goto :goto_151

    .line 225
    :cond_1be
    invoke-virtual/range {v20 .. v20}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v44

    goto :goto_193

    .line 245
    :cond_1c3
    aget v4, v6, v37

    int-to-long v12, v4

    add-long v44, v44, v12

    goto :goto_1b5

    .line 250
    :cond_1c9
    if-nez v54, :cond_1fe

    const/4 v4, 0x1

    :goto_1cc
    invoke-static {v4}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 251
    if-nez v50, :cond_200

    const/4 v4, 0x1

    :goto_1d2
    invoke-static {v4}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 252
    if-nez v52, :cond_202

    const/4 v4, 0x1

    :goto_1d8
    invoke-static {v4}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 253
    if-nez v55, :cond_204

    const/4 v4, 0x1

    :goto_1de
    invoke-static {v4}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 254
    if-nez v56, :cond_206

    const/4 v4, 0x1

    :goto_1e4
    invoke-static {v4}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 256
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListDurations:[J

    if-nez v4, :cond_208

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
    :cond_1fe
    const/4 v4, 0x0

    goto :goto_1cc

    .line 251
    :cond_200
    const/4 v4, 0x0

    goto :goto_1d2

    .line 252
    :cond_202
    const/4 v4, 0x0

    goto :goto_1d8

    .line 253
    :cond_204
    const/4 v4, 0x0

    goto :goto_1de

    .line 254
    :cond_206
    const/4 v4, 0x0

    goto :goto_1e4

    .line 266
    :cond_208
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListDurations:[J

    array-length v4, v4

    const/4 v12, 0x1

    if-ne v4, v12, :cond_246

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListDurations:[J

    const/4 v12, 0x0

    aget-wide v12, v4, v12

    const-wide/16 v14, 0x0

    cmp-long v4, v12, v14

    if-nez v4, :cond_246

    .line 270
    const/16 v37, 0x0

    :goto_21f
    array-length v4, v8

    move/from16 v0, v37

    if-ge v0, v4, :cond_23f

    .line 271
    aget-wide v12, v8, v37

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

    aput-wide v12, v8, v37

    .line 270
    add-int/lit8 v37, v37, 0x1

    goto :goto_21f

    .line 274
    :cond_23f
    new-instance v4, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;

    invoke-direct/range {v4 .. v9}, Lcom/google/android/exoplayer/extractor/mp4/TrackSampleTable;-><init>([J[II[J[I)V

    goto/16 :goto_83

    .line 278
    :cond_246
    const/16 v29, 0x0

    .line 279
    .local v29, "editedSampleCount":I
    const/16 v41, 0x0

    .line 280
    .local v41, "nextSampleIndex":I
    const/16 v22, 0x0

    .line 281
    .local v22, "copyMetadata":Z
    const/16 v37, 0x0

    :goto_24e
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListDurations:[J

    array-length v4, v4

    move/from16 v0, v37

    if-ge v0, v4, :cond_299

    .line 282
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListMediaTimes:[J

    aget-wide v39, v4, v37

    .line 283
    .local v39, "mediaTime":J
    const-wide/16 v12, -0x1

    cmp-long v4, v39, v12

    if-eqz v4, :cond_294

    .line 284
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListDurations:[J

    aget-wide v10, v4, v37

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

    move-wide/from16 v0, v39

    invoke-static {v8, v0, v1, v4, v12}, Lcom/google/android/exoplayer/util/Util;->binarySearchCeil([JJZZ)I

    move-result v60

    .line 287
    .local v60, "startIndex":I
    add-long v12, v39, v10

    const/4 v4, 0x1

    const/4 v14, 0x0

    invoke-static {v8, v12, v13, v4, v14}, Lcom/google/android/exoplayer/util/Util;->binarySearchCeil([JJZZ)I

    move-result v32

    .line 288
    .local v32, "endIndex":I
    sub-int v4, v32, v60

    add-int v29, v29, v4

    .line 289
    move/from16 v0, v41

    move/from16 v1, v60

    if-eq v0, v1, :cond_297

    const/4 v4, 0x1

    :goto_290
    or-int v22, v22, v4

    .line 290
    move/from16 v41, v32

    .line 281
    .end local v10    # "duration":J
    .end local v32    # "endIndex":I
    .end local v60    # "startIndex":I
    :cond_294
    add-int/lit8 v37, v37, 0x1

    goto :goto_24e

    .line 289
    .restart local v10    # "duration":J
    .restart local v32    # "endIndex":I
    .restart local v60    # "startIndex":I
    :cond_297
    const/4 v4, 0x0

    goto :goto_290

    .line 293
    .end local v10    # "duration":J
    .end local v32    # "endIndex":I
    .end local v39    # "mediaTime":J
    .end local v60    # "startIndex":I
    :cond_299
    move/from16 v0, v29

    move/from16 v1, v57

    if-eq v0, v1, :cond_363

    const/4 v4, 0x1

    :goto_2a0
    or-int v22, v22, v4

    .line 296
    if-eqz v22, :cond_366

    move/from16 v0, v29

    new-array v0, v0, [J

    move-object/from16 v28, v0

    .line 297
    .local v28, "editedOffsets":[J
    :goto_2aa
    if-eqz v22, :cond_36a

    move/from16 v0, v29

    new-array v0, v0, [I

    move-object/from16 v30, v0

    .line 298
    .local v30, "editedSizes":[I
    :goto_2b2
    if-eqz v22, :cond_36e

    const/16 v27, 0x0

    .line 299
    .local v27, "editedMaximumSize":I
    :goto_2b6
    if-eqz v22, :cond_372

    move/from16 v0, v29

    new-array v0, v0, [I

    move-object/from16 v26, v0

    .line 300
    .local v26, "editedFlags":[I
    :goto_2be
    move/from16 v0, v29

    new-array v0, v0, [J

    move-object/from16 v31, v0

    .line 301
    .local v31, "editedTimestamps":[J
    const-wide/16 v46, 0x0

    .line 302
    .local v46, "pts":J
    const/16 v58, 0x0

    .line 303
    .local v58, "sampleIndex":I
    const/16 v37, 0x0

    :goto_2ca
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListDurations:[J

    array-length v4, v4

    move/from16 v0, v37

    if-ge v0, v4, :cond_37c

    .line 304
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListMediaTimes:[J

    aget-wide v39, v4, v37

    .line 305
    .restart local v39    # "mediaTime":J
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->editListDurations:[J

    aget-wide v10, v4, v37

    .line 306
    .restart local v10    # "duration":J
    const-wide/16 v12, -0x1

    cmp-long v4, v39, v12

    if-eqz v4, :cond_376

    .line 307
    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->timescale:J

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->movieTimescale:J

    invoke-static/range {v10 .. v15}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v12

    add-long v33, v39, v12

    .line 309
    .local v33, "endMediaTime":J
    const/4 v4, 0x1

    const/4 v12, 0x1

    move-wide/from16 v0, v39

    invoke-static {v8, v0, v1, v4, v12}, Lcom/google/android/exoplayer/util/Util;->binarySearchCeil([JJZZ)I

    move-result v60

    .line 310
    .restart local v60    # "startIndex":I
    const/4 v4, 0x1

    const/4 v12, 0x0

    move-wide/from16 v0, v33

    invoke-static {v8, v0, v1, v4, v12}, Lcom/google/android/exoplayer/util/Util;->binarySearchCeil([JJZZ)I

    move-result v32

    .line 311
    .restart local v32    # "endIndex":I
    if-eqz v22, :cond_328

    .line 312
    sub-int v23, v32, v60

    .line 313
    .local v23, "count":I
    move/from16 v0, v60

    move-object/from16 v1, v28

    move/from16 v2, v58

    move/from16 v3, v23

    invoke-static {v5, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 314
    move/from16 v0, v60

    move-object/from16 v1, v30

    move/from16 v2, v58

    move/from16 v3, v23

    invoke-static {v6, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 315
    move/from16 v0, v60

    move-object/from16 v1, v26

    move/from16 v2, v58

    move/from16 v3, v23

    invoke-static {v9, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 317
    .end local v23    # "count":I
    :cond_328
    move/from16 v38, v60

    .local v38, "j":I
    :goto_32a
    move/from16 v0, v38

    move/from16 v1, v32

    if-ge v0, v1, :cond_376

    .line 318
    const-wide/32 v14, 0xf4240

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->movieTimescale:J

    move-wide/from16 v16, v0

    move-wide/from16 v12, v46

    invoke-static/range {v12 .. v17}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v48

    .line 319
    .local v48, "ptsUs":J
    aget-wide v12, v8, v38

    sub-long v12, v12, v39

    const-wide/32 v14, 0xf4240

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/exoplayer/extractor/mp4/Track;->timescale:J

    move-wide/from16 v16, v0

    invoke-static/range {v12 .. v17}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v66

    .line 321
    .local v66, "timeInSegmentUs":J
    add-long v12, v48, v66

    aput-wide v12, v31, v58

    .line 322
    if-eqz v22, :cond_35e

    aget v4, v30, v58

    move/from16 v0, v27

    if-le v4, v0, :cond_35e

    .line 323
    aget v27, v6, v38

    .line 325
    :cond_35e
    add-int/lit8 v58, v58, 0x1

    .line 317
    add-int/lit8 v38, v38, 0x1

    goto :goto_32a

    .line 293
    .end local v10    # "duration":J
    .end local v26    # "editedFlags":[I
    .end local v27    # "editedMaximumSize":I
    .end local v28    # "editedOffsets":[J
    .end local v30    # "editedSizes":[I
    .end local v31    # "editedTimestamps":[J
    .end local v32    # "endIndex":I
    .end local v33    # "endMediaTime":J
    .end local v38    # "j":I
    .end local v39    # "mediaTime":J
    .end local v46    # "pts":J
    .end local v48    # "ptsUs":J
    .end local v58    # "sampleIndex":I
    .end local v60    # "startIndex":I
    .end local v66    # "timeInSegmentUs":J
    :cond_363
    const/4 v4, 0x0

    goto/16 :goto_2a0

    :cond_366
    move-object/from16 v28, v5

    .line 296
    goto/16 :goto_2aa

    .restart local v28    # "editedOffsets":[J
    :cond_36a
    move-object/from16 v30, v6

    .line 297
    goto/16 :goto_2b2

    .restart local v30    # "editedSizes":[I
    :cond_36e
    move/from16 v27, v7

    .line 298
    goto/16 :goto_2b6

    .restart local v27    # "editedMaximumSize":I
    :cond_372
    move-object/from16 v26, v9

    .line 299
    goto/16 :goto_2be

    .line 328
    .restart local v10    # "duration":J
    .restart local v26    # "editedFlags":[I
    .restart local v31    # "editedTimestamps":[J
    .restart local v39    # "mediaTime":J
    .restart local v46    # "pts":J
    .restart local v58    # "sampleIndex":I
    :cond_376
    add-long v46, v46, v10

    .line 303
    add-int/lit8 v37, v37, 0x1

    goto/16 :goto_2ca

    .line 331
    .end local v10    # "duration":J
    .end local v39    # "mediaTime":J
    :cond_37c
    const/16 v36, 0x0

    .line 332
    .local v36, "hasSyncSample":Z
    const/16 v37, 0x0

    :goto_380
    move-object/from16 v0, v26

    array-length v4, v0

    move/from16 v0, v37

    if-ge v0, v4, :cond_397

    if-nez v36, :cond_397

    .line 333
    aget v4, v26, v37

    and-int/lit8 v4, v4, 0x1

    if-eqz v4, :cond_395

    const/4 v4, 0x1

    :goto_390
    or-int v36, v36, v4

    .line 332
    add-int/lit8 v37, v37, 0x1

    goto :goto_380

    .line 333
    :cond_395
    const/4 v4, 0x0

    goto :goto_390

    .line 335
    :cond_397
    if-nez v36, :cond_3a1

    .line 336
    new-instance v4, Lcom/google/android/exoplayer/ParserException;

    const-string v12, "The edited sample sequence does not contain a sync sample."

    invoke-direct {v4, v12}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 339
    :cond_3a1
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
    .line 542
    const/16 v1, 0xc

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 543
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v21

    .line 544
    .local v21, "numberOfEntries":I
    new-instance v8, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;

    move/from16 v0, v21

    invoke-direct {v8, v0}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;-><init>(I)V

    .line 545
    .local v8, "out":Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_13
    move/from16 v0, v21

    if-ge v9, v0, :cond_f6

    .line 546
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v2

    .line 547
    .local v2, "childStartPosition":I
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v3

    .line 548
    .local v3, "childAtomSize":I
    if-lez v3, :cond_5c

    const/4 v1, 0x1

    :goto_22
    const-string v4, "childAtomSize should be positive"

    invoke-static {v1, v4}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(ZLjava/lang/Object;)V

    .line 549
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v11

    .line 550
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

    .line 554
    invoke-static/range {v1 .. v9}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseVideoSampleEntry(Lcom/google/android/exoplayer/util/ParsableByteArray;IIIJILcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;I)V

    .line 577
    :cond_52
    :goto_52
    add-int v1, v2, v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 545
    add-int/lit8 v9, v9, 0x1

    goto :goto_13

    .line 548
    .end local v11    # "childAtomType":I
    :cond_5c
    const/4 v1, 0x0

    goto :goto_22

    .line 556
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

    .line 561
    invoke-static/range {v10 .. v20}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseAudioSampleEntry(Lcom/google/android/exoplayer/util/ParsableByteArray;IIIIJLjava/lang/String;ZLcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;I)V

    goto :goto_52

    .line 563
    :cond_9a
    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_TTML:I

    if-ne v11, v1, :cond_b0

    .line 564
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

    .line 566
    :cond_b0
    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_tx3g:I

    if-ne v11, v1, :cond_c6

    .line 567
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

    .line 569
    :cond_c6
    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_wvtt:I

    if-ne v11, v1, :cond_dd

    .line 570
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

    .line 572
    :cond_dd
    sget v1, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stpp:I

    if-ne v11, v1, :cond_52

    .line 573
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

    .line 579
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
    .line 449
    const/16 v17, 0x8

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 450
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v12

    .line 451
    .local v12, "fullAtom":I
    invoke-static {v12}, Lcom/google/android/exoplayer/extractor/mp4/Atom;->parseFullAtomVersion(I)I

    move-result v16

    .line 453
    .local v16, "version":I
    if-nez v16, :cond_8b

    const/16 v17, 0x8

    :goto_15
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 454
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v15

    .line 456
    .local v15, "trackId":I
    const/16 v17, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 457
    const/4 v10, 0x1

    .line 458
    .local v10, "durationUnknown":Z
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v9

    .line 459
    .local v9, "durationPosition":I
    if-nez v16, :cond_8e

    const/4 v8, 0x4

    .line 460
    .local v8, "durationByteCount":I
    :goto_31
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_32
    if-ge v13, v8, :cond_47

    .line 461
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v17, v0

    add-int v18, v9, v13

    aget-byte v17, v17, v18

    const/16 v18, -0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_91

    .line 462
    const/4 v10, 0x0

    .line 467
    :cond_47
    if-eqz v10, :cond_94

    .line 468
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 469
    const-wide/16 v6, -0x1

    .line 474
    .local v6, "duration":J
    :goto_50
    const/16 v17, 0x10

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 475
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v2

    .line 476
    .local v2, "a00":I
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v3

    .line 477
    .local v3, "a01":I
    const/16 v17, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 478
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v4

    .line 479
    .local v4, "a10":I
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v5

    .line 482
    .local v5, "a11":I
    const/high16 v11, 0x10000

    .line 483
    .local v11, "fixedOne":I
    if-nez v2, :cond_a0

    if-ne v3, v11, :cond_a0

    neg-int v0, v11

    move/from16 v17, v0

    move/from16 v0, v17

    if-ne v4, v0, :cond_a0

    if-nez v5, :cond_a0

    .line 484
    const/16 v14, 0x5a

    .line 494
    .local v14, "rotationDegrees":I
    :goto_83
    new-instance v17, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$TkhdData;

    move-object/from16 v0, v17

    invoke-direct {v0, v15, v6, v7, v14}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$TkhdData;-><init>(IJI)V

    return-object v17

    .line 453
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

    .line 459
    .restart local v9    # "durationPosition":I
    .restart local v10    # "durationUnknown":Z
    .restart local v15    # "trackId":I
    :cond_8e
    const/16 v8, 0x8

    goto :goto_31

    .line 460
    .restart local v8    # "durationByteCount":I
    .restart local v13    # "i":I
    :cond_91
    add-int/lit8 v13, v13, 0x1

    goto :goto_32

    .line 471
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

    .line 485
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

    .line 486
    const/16 v14, 0x10e

    .restart local v14    # "rotationDegrees":I
    goto :goto_83

    .line 487
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

    .line 488
    const/16 v14, 0xb4

    .restart local v14    # "rotationDegrees":I
    goto :goto_83

    .line 491
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
    .line 51
    sget v3, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mdia:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getContainerAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    move-result-object v27

    .line 52
    .local v27, "mdia":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    sget v3, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_hdlr:I

    move-object/from16 v0, v27

    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v3

    iget-object v3, v3, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-static {v3}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseHdlr(Lcom/google/android/exoplayer/util/ParsableByteArray;)I

    move-result v31

    .line 53
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

    .line 55
    const/4 v11, 0x0

    .line 74
    :goto_35
    return-object v11

    .line 58
    :cond_36
    sget v3, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_tkhd:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v3

    iget-object v3, v3, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-static {v3}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseTkhd(Lcom/google/android/exoplayer/util/ParsableByteArray;)Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$TkhdData;

    move-result-object v30

    .line 59
    .local v30, "tkhdData":Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$TkhdData;
    # getter for: Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$TkhdData;->duration:J
    invoke-static/range {v30 .. v30}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$TkhdData;->access$000(Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$TkhdData;)J

    move-result-wide v1

    .line 60
    .local v1, "duration":J
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-static {v3}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseMvhd(Lcom/google/android/exoplayer/util/ParsableByteArray;)J

    move-result-wide v5

    .line 62
    .local v5, "movieTimescale":J
    const-wide/16 v3, -0x1

    cmp-long v3, v1, v3

    if-nez v3, :cond_a6

    .line 63
    const-wide/16 v9, -0x1

    .line 67
    .local v9, "durationUs":J
    :goto_58
    sget v3, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_minf:I

    move-object/from16 v0, v27

    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getContainerAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    move-result-object v3

    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_stbl:I

    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getContainerAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    move-result-object v28

    .line 70
    .local v28, "stbl":Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;
    sget v3, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_mdhd:I

    move-object/from16 v0, v27

    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;

    move-result-object v3

    iget-object v3, v3, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-static {v3}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseMdhd(Lcom/google/android/exoplayer/util/ParsableByteArray;)Landroid/util/Pair;

    move-result-object v26

    .line 71
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

    .line 73
    .local v29, "stsdData":Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;
    sget v3, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_edts:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;->getContainerAtomOfType(I)Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseEdts(Lcom/google/android/exoplayer/extractor/mp4/Atom$ContainerAtom;)Landroid/util/Pair;

    move-result-object v25

    .line 74
    .local v25, "edtsData":Landroid/util/Pair;, "Landroid/util/Pair<[J[J>;"
    move-object/from16 v0, v29

    iget-object v3, v0, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    if-nez v3, :cond_ae

    const/4 v11, 0x0

    goto :goto_35

    .line 65
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

    .line 74
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

.method public static parseUdta(Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;Z)Lcom/google/android/exoplayer/extractor/GaplessInfo;
    .registers 8
    .param p0, "udtaAtom"    # Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;
    .param p1, "isQuickTime"    # Z

    .prologue
    const/4 v3, 0x0

    const/16 v5, 0x8

    .line 351
    if-eqz p1, :cond_6

    .line 369
    :cond_5
    :goto_5
    return-object v3

    .line 356
    :cond_6
    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 357
    .local v2, "udtaData":Lcom/google/android/exoplayer/util/ParsableByteArray;
    invoke-virtual {v2, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 358
    :goto_b
    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v4

    if-lt v4, v5, :cond_5

    .line 359
    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v0

    .line 360
    .local v0, "atomSize":I
    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v1

    .line 361
    .local v1, "atomType":I
    sget v4, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_meta:I

    if-ne v1, v4, :cond_33

    .line 362
    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v3

    add-int/lit8 v3, v3, -0x8

    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 363
    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v3

    add-int/2addr v3, v0

    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setLimit(I)V

    .line 364
    invoke-static {v2}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseMetaAtom(Lcom/google/android/exoplayer/util/ParsableByteArray;)Lcom/google/android/exoplayer/extractor/GaplessInfo;

    move-result-object v3

    goto :goto_5

    .line 366
    :cond_33
    add-int/lit8 v4, v0, -0x8

    invoke-virtual {v2, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    goto :goto_b
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
    .line 584
    add-int/lit8 v2, p1, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 586
    const/16 v2, 0x18

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 587
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v8

    .line 588
    .local v8, "width":I
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v9

    .line 589
    .local v9, "height":I
    const/16 v20, 0x0

    .line 590
    .local v20, "pixelWidthHeightRatioFromPasp":Z
    const/high16 v12, 0x3f800000    # 1.0f

    .line 591
    .local v12, "pixelWidthHeightRatio":F
    const/16 v2, 0x32

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 593
    const/4 v10, 0x0

    .line 594
    .local v10, "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v16

    .line 595
    .local v16, "childPosition":I
    const/4 v3, 0x0

    .line 596
    .local v3, "mimeType":Ljava/lang/String;
    :goto_27
    sub-int v2, v16, p1

    move/from16 v0, p2

    if-ge v2, v0, :cond_48

    .line 597
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 598
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v17

    .line 599
    .local v17, "childStartPosition":I
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v14

    .line 600
    .local v14, "childAtomSize":I
    if-nez v14, :cond_4b

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v2

    sub-int v2, v2, p1

    move/from16 v0, p2

    if-ne v2, v0, :cond_4b

    .line 641
    .end local v14    # "childAtomSize":I
    .end local v17    # "childStartPosition":I
    :cond_48
    if-nez v3, :cond_fe

    .line 648
    :goto_4a
    return-void

    .line 604
    .restart local v14    # "childAtomSize":I
    .restart local v17    # "childStartPosition":I
    :cond_4b
    if-lez v14, :cond_7a

    const/4 v2, 0x1

    :goto_4e
    const-string v4, "childAtomSize should be positive"

    invoke-static {v2, v4}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(ZLjava/lang/Object;)V

    .line 605
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v15

    .line 606
    .local v15, "childAtomType":I
    sget v2, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_avcC:I

    if-ne v15, v2, :cond_7e

    .line 607
    if-nez v3, :cond_7c

    const/4 v2, 0x1

    :goto_5e
    invoke-static {v2}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 608
    const-string v3, "video/avc"

    .line 609
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-static {v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseAvcCFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$AvcCData;

    move-result-object v13

    .line 610
    .local v13, "avcCData":Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$AvcCData;
    iget-object v10, v13, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$AvcCData;->initializationData:Ljava/util/List;

    .line 611
    iget v2, v13, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$AvcCData;->nalUnitLengthFieldLength:I

    move-object/from16 v0, p7

    iput v2, v0, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;->nalUnitLengthFieldLength:I

    .line 612
    if-nez v20, :cond_77

    .line 613
    iget v12, v13, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$AvcCData;->pixelWidthAspectRatio:F

    .line 637
    .end local v13    # "avcCData":Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$AvcCData;
    :cond_77
    :goto_77
    add-int v16, v16, v14

    .line 638
    goto :goto_27

    .line 604
    .end local v15    # "childAtomType":I
    :cond_7a
    const/4 v2, 0x0

    goto :goto_4e

    .line 607
    .restart local v15    # "childAtomType":I
    :cond_7c
    const/4 v2, 0x0

    goto :goto_5e

    .line 615
    :cond_7e
    sget v2, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_hvcC:I

    if-ne v15, v2, :cond_a9

    .line 616
    if-nez v3, :cond_a7

    const/4 v2, 0x1

    :goto_85
    invoke-static {v2}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 617
    const-string v3, "video/hevc"

    .line 618
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-static {v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseHvcCFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)Landroid/util/Pair;

    move-result-object v18

    .line 619
    .local v18, "hvcCData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/util/List<[B>;Ljava/lang/Integer;>;"
    move-object/from16 v0, v18

    iget-object v10, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .end local v10    # "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    check-cast v10, Ljava/util/List;

    .line 620
    .restart local v10    # "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    move-object/from16 v0, v18

    iget-object v2, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    move-object/from16 v0, p7

    iput v2, v0, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;->nalUnitLengthFieldLength:I

    goto :goto_77

    .line 616
    .end local v18    # "hvcCData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/util/List<[B>;Ljava/lang/Integer;>;"
    :cond_a7
    const/4 v2, 0x0

    goto :goto_85

    .line 621
    :cond_a9
    sget v2, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_d263:I

    if-ne v15, v2, :cond_b8

    .line 622
    if-nez v3, :cond_b6

    const/4 v2, 0x1

    :goto_b0
    invoke-static {v2}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 623
    const-string v3, "video/3gpp"

    goto :goto_77

    .line 622
    :cond_b6
    const/4 v2, 0x0

    goto :goto_b0

    .line 624
    :cond_b8
    sget v2, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_esds:I

    if-ne v15, v2, :cond_db

    .line 625
    if-nez v3, :cond_d9

    const/4 v2, 0x1

    :goto_bf
    invoke-static {v2}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 626
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-static {v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseEsdsFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)Landroid/util/Pair;

    move-result-object v19

    .line 628
    .local v19, "mimeTypeAndInitializationData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;[B>;"
    move-object/from16 v0, v19

    iget-object v3, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .end local v3    # "mimeType":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 629
    .restart local v3    # "mimeType":Ljava/lang/String;
    move-object/from16 v0, v19

    iget-object v2, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    .line 630
    goto :goto_77

    .line 625
    .end local v19    # "mimeTypeAndInitializationData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;[B>;"
    :cond_d9
    const/4 v2, 0x0

    goto :goto_bf

    .line 630
    :cond_db
    sget v2, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_sinf:I

    if-ne v15, v2, :cond_ee

    .line 631
    move-object/from16 v0, p7

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers$StsdData;->trackEncryptionBoxes:[Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-static {v0, v1, v14}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parseSinfFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;II)Lcom/google/android/exoplayer/extractor/mp4/TrackEncryptionBox;

    move-result-object v4

    aput-object v4, v2, p8

    goto :goto_77

    .line 633
    :cond_ee
    sget v2, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_pasp:I

    if-ne v15, v2, :cond_77

    .line 634
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-static {v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/AtomParsers;->parsePaspFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)F

    move-result v12

    .line 635
    const/16 v20, 0x1

    goto/16 :goto_77

    .line 645
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
