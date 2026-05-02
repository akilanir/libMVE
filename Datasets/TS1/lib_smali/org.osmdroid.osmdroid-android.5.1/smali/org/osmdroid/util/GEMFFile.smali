.class public Lorg/osmdroid/util/GEMFFile;
.super Ljava/lang/Object;
.source "GEMFFile.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/osmdroid/util/GEMFFile$1;,
        Lorg/osmdroid/util/GEMFFile$GEMFInputStream;,
        Lorg/osmdroid/util/GEMFFile$GEMFRange;
    }
.end annotation


# static fields
.field private static final FILE_COPY_BUFFER_SIZE:I = 0x400

.field private static final FILE_SIZE_LIMIT:J = 0x40000000L

.field private static final TILE_SIZE:I = 0x100

.field private static final U32_SIZE:I = 0x4

.field private static final U64_SIZE:I = 0x8

.field private static final VERSION:I = 0x4


# instance fields
.field private mCurrentSource:I

.field private final mFileNames:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mFileSizes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final mFiles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/io/RandomAccessFile;",
            ">;"
        }
    .end annotation
.end field

.field private final mLocation:Ljava/lang/String;

.field private final mRangeData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/osmdroid/util/GEMFFile$GEMFRange;",
            ">;"
        }
    .end annotation
.end field

.field private mSourceLimited:Z

.field private final mSources:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "pLocation"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/osmdroid/util/GEMFFile;-><init>(Ljava/lang/String;)V

    .line 79
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "pLocation"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/util/GEMFFile;->mFiles:Ljava/util/List;

    .line 50
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/util/GEMFFile;->mFileNames:Ljava/util/List;

    .line 53
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/util/GEMFFile;->mRangeData:Ljava/util/List;

    .line 56
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/util/GEMFFile;->mFileSizes:Ljava/util/List;

    .line 59
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/util/GEMFFile;->mSources:Ljava/util/LinkedHashMap;

    .line 62
    iput-boolean v1, p0, Lorg/osmdroid/util/GEMFFile;->mSourceLimited:Z

    .line 63
    iput v1, p0, Lorg/osmdroid/util/GEMFFile;->mCurrentSource:I

    .line 89
    iput-object p1, p0, Lorg/osmdroid/util/GEMFFile;->mLocation:Ljava/lang/String;

    .line 90
    invoke-direct {p0}, Lorg/osmdroid/util/GEMFFile;->openFiles()V

    .line 91
    invoke-direct {p0}, Lorg/osmdroid/util/GEMFFile;->readHeader()V

    .line 92
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/List;)V
    .registers 59
    .param p1, "pLocation"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    .local p2, "pSourceFolders":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v52, Ljava/util/ArrayList;

    invoke-direct/range {v52 .. v52}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v52

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/osmdroid/util/GEMFFile;->mFiles:Ljava/util/List;

    .line 50
    new-instance v52, Ljava/util/ArrayList;

    invoke-direct/range {v52 .. v52}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v52

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/osmdroid/util/GEMFFile;->mFileNames:Ljava/util/List;

    .line 53
    new-instance v52, Ljava/util/ArrayList;

    invoke-direct/range {v52 .. v52}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v52

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/osmdroid/util/GEMFFile;->mRangeData:Ljava/util/List;

    .line 56
    new-instance v52, Ljava/util/ArrayList;

    invoke-direct/range {v52 .. v52}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v52

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/osmdroid/util/GEMFFile;->mFileSizes:Ljava/util/List;

    .line 59
    new-instance v52, Ljava/util/LinkedHashMap;

    invoke-direct/range {v52 .. v52}, Ljava/util/LinkedHashMap;-><init>()V

    move-object/from16 v0, v52

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/osmdroid/util/GEMFFile;->mSources:Ljava/util/LinkedHashMap;

    .line 62
    const/16 v52, 0x0

    move/from16 v0, v52

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/osmdroid/util/GEMFFile;->mSourceLimited:Z

    .line 63
    const/16 v52, 0x0

    move/from16 v0, v52

    move-object/from16 v1, p0

    iput v0, v1, Lorg/osmdroid/util/GEMFFile;->mCurrentSource:I

    .line 126
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/osmdroid/util/GEMFFile;->mLocation:Ljava/lang/String;

    .line 129
    new-instance v9, Ljava/util/LinkedHashMap;

    invoke-direct {v9}, Ljava/util/LinkedHashMap;-><init>()V

    .line 132
    .local v9, "dirIndex":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/util/LinkedHashMap<Ljava/lang/Integer;Ljava/util/LinkedHashMap<Ljava/lang/Integer;Ljava/util/LinkedHashMap<Ljava/lang/Integer;Ljava/io/File;>;>;>;>;"
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :goto_59
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v52

    if-eqz v52, :cond_13d

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v33

    check-cast v33, Ljava/io/File;

    .line 134
    .local v33, "sourceDir":Ljava/io/File;
    new-instance v50, Ljava/util/LinkedHashMap;

    invoke-direct/range {v50 .. v50}, Ljava/util/LinkedHashMap;-><init>()V

    .line 137
    .local v50, "zList":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/Integer;Ljava/util/LinkedHashMap<Ljava/lang/Integer;Ljava/util/LinkedHashMap<Ljava/lang/Integer;Ljava/io/File;>;>;>;"
    invoke-virtual/range {v33 .. v33}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    .local v3, "arr$":[Ljava/io/File;
    array-length v0, v3

    move/from16 v23, v0

    .local v23, "len$":I
    const/16 v19, 0x0

    .local v19, "i$":I
    move/from16 v21, v19

    .end local v3    # "arr$":[Ljava/io/File;
    .end local v19    # "i$":I
    .end local v23    # "len$":I
    .local v21, "i$":I
    :goto_75
    move/from16 v0, v21

    move/from16 v1, v23

    if-ge v0, v1, :cond_130

    aget-object v49, v3, v21

    .line 140
    .local v49, "zDir":Ljava/io/File;
    :try_start_7d
    invoke-virtual/range {v49 .. v49}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v52

    invoke-static/range {v52 .. v52}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_84
    .catch Ljava/lang/NumberFormatException; {:try_start_7d .. :try_end_84} :catch_f8

    .line 145
    new-instance v39, Ljava/util/LinkedHashMap;

    invoke-direct/range {v39 .. v39}, Ljava/util/LinkedHashMap;-><init>()V

    .line 148
    .local v39, "xList":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/Integer;Ljava/util/LinkedHashMap<Ljava/lang/Integer;Ljava/io/File;>;>;"
    invoke-virtual/range {v49 .. v49}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v4

    .local v4, "arr$":[Ljava/io/File;
    array-length v0, v4

    move/from16 v24, v0

    .local v24, "len$":I
    const/16 v19, 0x0

    .end local v21    # "i$":I
    .restart local v19    # "i$":I
    move/from16 v20, v19

    .end local v4    # "arr$":[Ljava/io/File;
    .end local v19    # "i$":I
    .end local v24    # "len$":I
    .local v20, "i$":I
    :goto_94
    move/from16 v0, v20

    move/from16 v1, v24

    if-ge v0, v1, :cond_11a

    aget-object v38, v4, v20

    .line 152
    .local v38, "xDir":Ljava/io/File;
    :try_start_9c
    invoke-virtual/range {v38 .. v38}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v52

    invoke-static/range {v52 .. v52}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_a3
    .catch Ljava/lang/NumberFormatException; {:try_start_9c .. :try_end_a3} :catch_ff

    .line 157
    new-instance v45, Ljava/util/LinkedHashMap;

    invoke-direct/range {v45 .. v45}, Ljava/util/LinkedHashMap;-><init>()V

    .line 158
    .local v45, "yList":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/Integer;Ljava/io/File;>;"
    invoke-virtual/range {v38 .. v38}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v5

    .local v5, "arr$":[Ljava/io/File;
    array-length v0, v5

    move/from16 v25, v0

    .local v25, "len$":I
    const/16 v19, 0x0

    .end local v20    # "i$":I
    .restart local v19    # "i$":I
    :goto_b1
    move/from16 v0, v19

    move/from16 v1, v25

    if-ge v0, v1, :cond_107

    aget-object v44, v5, v19

    .line 161
    .local v44, "yFile":Ljava/io/File;
    :try_start_b9
    invoke-virtual/range {v44 .. v44}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v52

    const/16 v53, 0x0

    invoke-virtual/range {v44 .. v44}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v54

    const/16 v55, 0x2e

    invoke-virtual/range {v54 .. v55}, Ljava/lang/String;->indexOf(I)I

    move-result v54

    invoke-virtual/range {v52 .. v54}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v52

    invoke-static/range {v52 .. v52}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_d0
    .catch Ljava/lang/NumberFormatException; {:try_start_b9 .. :try_end_d0} :catch_105

    .line 167
    invoke-virtual/range {v44 .. v44}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v52

    const/16 v53, 0x0

    invoke-virtual/range {v44 .. v44}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v54

    const/16 v55, 0x2e

    invoke-virtual/range {v54 .. v55}, Ljava/lang/String;->indexOf(I)I

    move-result v54

    invoke-virtual/range {v52 .. v54}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v52

    invoke-static/range {v52 .. v52}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v52

    invoke-static/range {v52 .. v52}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v52

    move-object/from16 v0, v45

    move-object/from16 v1, v52

    move-object/from16 v2, v44

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    :goto_f5
    add-int/lit8 v19, v19, 0x1

    goto :goto_b1

    .line 141
    .end local v5    # "arr$":[Ljava/io/File;
    .end local v19    # "i$":I
    .end local v25    # "len$":I
    .end local v38    # "xDir":Ljava/io/File;
    .end local v39    # "xList":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/Integer;Ljava/util/LinkedHashMap<Ljava/lang/Integer;Ljava/io/File;>;>;"
    .end local v44    # "yFile":Ljava/io/File;
    .end local v45    # "yList":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/Integer;Ljava/io/File;>;"
    .restart local v21    # "i$":I
    :catch_f8
    move-exception v10

    .line 137
    .end local v21    # "i$":I
    :goto_f9
    add-int/lit8 v19, v21, 0x1

    .restart local v19    # "i$":I
    move/from16 v21, v19

    .end local v19    # "i$":I
    .restart local v21    # "i$":I
    goto/16 :goto_75

    .line 153
    .end local v21    # "i$":I
    .restart local v20    # "i$":I
    .restart local v38    # "xDir":Ljava/io/File;
    .restart local v39    # "xList":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/Integer;Ljava/util/LinkedHashMap<Ljava/lang/Integer;Ljava/io/File;>;>;"
    :catch_ff
    move-exception v10

    .line 148
    .end local v20    # "i$":I
    :goto_100
    add-int/lit8 v19, v20, 0x1

    .restart local v19    # "i$":I
    move/from16 v20, v19

    .end local v19    # "i$":I
    .restart local v20    # "i$":I
    goto :goto_94

    .line 163
    .end local v20    # "i$":I
    .restart local v5    # "arr$":[Ljava/io/File;
    .restart local v19    # "i$":I
    .restart local v25    # "len$":I
    .restart local v44    # "yFile":Ljava/io/File;
    .restart local v45    # "yList":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/Integer;Ljava/io/File;>;"
    :catch_105
    move-exception v10

    .line 164
    .local v10, "e":Ljava/lang/NumberFormatException;
    goto :goto_f5

    .line 171
    .end local v10    # "e":Ljava/lang/NumberFormatException;
    .end local v44    # "yFile":Ljava/io/File;
    :cond_107
    new-instance v52, Ljava/lang/Integer;

    invoke-virtual/range {v38 .. v38}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v53

    invoke-direct/range {v52 .. v53}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v39

    move-object/from16 v1, v52

    move-object/from16 v2, v45

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_100

    .line 174
    .end local v5    # "arr$":[Ljava/io/File;
    .end local v19    # "i$":I
    .end local v25    # "len$":I
    .end local v38    # "xDir":Ljava/io/File;
    .end local v45    # "yList":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/Integer;Ljava/io/File;>;"
    .restart local v20    # "i$":I
    :cond_11a
    invoke-virtual/range {v49 .. v49}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v52

    invoke-static/range {v52 .. v52}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v52

    invoke-static/range {v52 .. v52}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v52

    move-object/from16 v0, v50

    move-object/from16 v1, v52

    move-object/from16 v2, v39

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_f9

    .line 177
    .end local v20    # "i$":I
    .end local v39    # "xList":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/Integer;Ljava/util/LinkedHashMap<Ljava/lang/Integer;Ljava/io/File;>;>;"
    .end local v49    # "zDir":Ljava/io/File;
    .restart local v21    # "i$":I
    :cond_130
    invoke-virtual/range {v33 .. v33}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v52

    move-object/from16 v0, v52

    move-object/from16 v1, v50

    invoke-virtual {v9, v0, v1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_59

    .line 181
    .end local v21    # "i$":I
    .end local v33    # "sourceDir":Ljava/io/File;
    .end local v50    # "zList":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/Integer;Ljava/util/LinkedHashMap<Ljava/lang/Integer;Ljava/util/LinkedHashMap<Ljava/lang/Integer;Ljava/io/File;>;>;>;"
    :cond_13d
    new-instance v34, Ljava/util/LinkedHashMap;

    invoke-direct/range {v34 .. v34}, Ljava/util/LinkedHashMap;-><init>()V

    .line 182
    .local v34, "sourceIndex":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    new-instance v22, Ljava/util/LinkedHashMap;

    invoke-direct/range {v22 .. v22}, Ljava/util/LinkedHashMap;-><init>()V

    .line 183
    .local v22, "indexSource":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/Integer;Ljava/lang/String;>;"
    const/16 v31, 0x0

    .line 184
    .local v31, "si":I
    invoke-virtual {v9}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v52

    invoke-interface/range {v52 .. v52}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v18

    .local v18, "i$":Ljava/util/Iterator;
    :goto_151
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v52

    if-eqz v52, :cond_184

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Ljava/lang/String;

    .line 185
    .local v32, "source":Ljava/lang/String;
    new-instance v52, Ljava/lang/Integer;

    move-object/from16 v0, v52

    move/from16 v1, v31

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    move-object/from16 v0, v34

    move-object/from16 v1, v32

    move-object/from16 v2, v52

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    new-instance v52, Ljava/lang/Integer;

    move-object/from16 v0, v52

    move/from16 v1, v31

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    move-object/from16 v0, v22

    move-object/from16 v1, v52

    move-object/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    add-int/lit8 v31, v31, 0x1

    .line 188
    goto :goto_151

    .line 191
    .end local v32    # "source":Ljava/lang/String;
    :cond_184
    new-instance v29, Ljava/util/ArrayList;

    invoke-direct/range {v29 .. v29}, Ljava/util/ArrayList;-><init>()V

    .line 193
    .local v29, "ranges":Ljava/util/List;, "Ljava/util/List<Lorg/osmdroid/util/GEMFFile$GEMFRange;>;"
    invoke-virtual {v9}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v52

    invoke-interface/range {v52 .. v52}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v18

    .end local v18    # "i$":Ljava/util/Iterator;
    :cond_191
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v52

    if-eqz v52, :cond_40b

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Ljava/lang/String;

    .line 194
    .restart local v32    # "source":Ljava/lang/String;
    move-object/from16 v0, v32

    invoke-virtual {v9, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/util/LinkedHashMap;

    invoke-virtual/range {v52 .. v52}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v52

    invoke-interface/range {v52 .. v52}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :cond_1ad
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v52

    if-eqz v52, :cond_191

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v51

    check-cast v51, Ljava/lang/Integer;

    .line 197
    .local v51, "zoom":Ljava/lang/Integer;
    new-instance v48, Ljava/util/LinkedHashMap;

    invoke-direct/range {v48 .. v48}, Ljava/util/LinkedHashMap;-><init>()V

    .line 200
    .local v48, "ySets":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/util/List<Ljava/lang/Integer;>;Ljava/util/List<Ljava/lang/Integer;>;>;"
    new-instance v53, Ljava/util/TreeSet;

    move-object/from16 v0, v32

    invoke-virtual {v9, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/util/LinkedHashMap;

    move-object/from16 v0, v52

    move-object/from16 v1, v51

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/util/LinkedHashMap;

    invoke-virtual/range {v52 .. v52}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v52

    move-object/from16 v0, v53

    move-object/from16 v1, v52

    invoke-direct {v0, v1}, Ljava/util/TreeSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual/range {v53 .. v53}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v20

    :cond_1e1
    :goto_1e1
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v52

    if-eqz v52, :cond_25d

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v37

    check-cast v37, Ljava/lang/Integer;

    .line 202
    .local v37, "x":Ljava/lang/Integer;
    new-instance v47, Ljava/util/ArrayList;

    invoke-direct/range {v47 .. v47}, Ljava/util/ArrayList;-><init>()V

    .line 203
    .local v47, "ySet":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    move-object/from16 v0, v32

    invoke-virtual {v9, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/util/LinkedHashMap;

    move-object/from16 v0, v52

    move-object/from16 v1, v51

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/util/LinkedHashMap;

    move-object/from16 v0, v52

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/util/LinkedHashMap;

    invoke-virtual/range {v52 .. v52}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v52

    invoke-interface/range {v52 .. v52}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v21

    .local v21, "i$":Ljava/util/Iterator;
    :goto_216
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v52

    if-eqz v52, :cond_22a

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v43

    check-cast v43, Ljava/lang/Integer;

    .line 204
    .local v43, "y":Ljava/lang/Integer;
    move-object/from16 v0, v47

    move-object/from16 v1, v43

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_216

    .line 207
    .end local v43    # "y":Ljava/lang/Integer;
    :cond_22a
    invoke-interface/range {v47 .. v47}, Ljava/util/List;->size()I

    move-result v52

    if-eqz v52, :cond_1e1

    .line 211
    invoke-static/range {v47 .. v47}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 213
    move-object/from16 v0, v48

    move-object/from16 v1, v47

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v52

    if-nez v52, :cond_24b

    .line 214
    new-instance v52, Ljava/util/ArrayList;

    invoke-direct/range {v52 .. v52}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v48

    move-object/from16 v1, v47

    move-object/from16 v2, v52

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    :cond_24b
    move-object/from16 v0, v48

    move-object/from16 v1, v47

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/util/List;

    move-object/from16 v0, v52

    move-object/from16 v1, v37

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1e1

    .line 221
    .end local v21    # "i$":Ljava/util/Iterator;
    .end local v37    # "x":Ljava/lang/Integer;
    .end local v47    # "ySet":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_25d
    new-instance v42, Ljava/util/LinkedHashMap;

    invoke-direct/range {v42 .. v42}, Ljava/util/LinkedHashMap;-><init>()V

    .line 224
    .local v42, "xSets":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/util/List<Ljava/lang/Integer;>;Ljava/util/List<Ljava/lang/Integer;>;>;"
    invoke-virtual/range {v48 .. v48}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v52

    invoke-interface/range {v52 .. v52}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v20

    .local v20, "i$":Ljava/util/Iterator;
    :cond_26a
    :goto_26a
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v52

    if-eqz v52, :cond_2f6

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v47

    check-cast v47, Ljava/util/List;

    .line 226
    .restart local v47    # "ySet":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v40, Ljava/util/TreeSet;

    move-object/from16 v0, v48

    move-object/from16 v1, v47

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/util/Collection;

    move-object/from16 v0, v40

    move-object/from16 v1, v52

    invoke-direct {v0, v1}, Ljava/util/TreeSet;-><init>(Ljava/util/Collection;)V

    .line 228
    .local v40, "xList":Ljava/util/TreeSet;, "Ljava/util/TreeSet<Ljava/lang/Integer;>;"
    new-instance v41, Ljava/util/ArrayList;

    invoke-direct/range {v41 .. v41}, Ljava/util/ArrayList;-><init>()V

    .line 229
    .local v41, "xSet":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-virtual/range {v40 .. v40}, Ljava/util/TreeSet;->first()Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/lang/Integer;

    invoke-virtual/range {v52 .. v52}, Ljava/lang/Integer;->intValue()I

    move-result v17

    .local v17, "i":I
    :goto_298
    invoke-virtual/range {v40 .. v40}, Ljava/util/TreeSet;->last()Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/lang/Integer;

    invoke-virtual/range {v52 .. v52}, Ljava/lang/Integer;->intValue()I

    move-result v52

    add-int/lit8 v52, v52, 0x1

    move/from16 v0, v17

    move/from16 v1, v52

    if-ge v0, v1, :cond_2e5

    .line 230
    new-instance v52, Ljava/lang/Integer;

    move-object/from16 v0, v52

    move/from16 v1, v17

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    move-object/from16 v0, v40

    move-object/from16 v1, v52

    invoke-virtual {v0, v1}, Ljava/util/TreeSet;->contains(Ljava/lang/Object;)Z

    move-result v52

    if-eqz v52, :cond_2d0

    .line 231
    new-instance v52, Ljava/lang/Integer;

    move-object/from16 v0, v52

    move/from16 v1, v17

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    move-object/from16 v0, v41

    move-object/from16 v1, v52

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 229
    :cond_2cd
    :goto_2cd
    add-int/lit8 v17, v17, 0x1

    goto :goto_298

    .line 233
    :cond_2d0
    invoke-interface/range {v41 .. v41}, Ljava/util/List;->size()I

    move-result v52

    if-lez v52, :cond_2cd

    .line 234
    move-object/from16 v0, v42

    move-object/from16 v1, v47

    move-object/from16 v2, v41

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    new-instance v41, Ljava/util/ArrayList;

    .end local v41    # "xSet":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-direct/range {v41 .. v41}, Ljava/util/ArrayList;-><init>()V

    .restart local v41    # "xSet":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    goto :goto_2cd

    .line 240
    :cond_2e5
    invoke-interface/range {v41 .. v41}, Ljava/util/List;->size()I

    move-result v52

    if-lez v52, :cond_26a

    .line 241
    move-object/from16 v0, v42

    move-object/from16 v1, v47

    move-object/from16 v2, v41

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_26a

    .line 246
    .end local v17    # "i":I
    .end local v40    # "xList":Ljava/util/TreeSet;, "Ljava/util/TreeSet<Ljava/lang/Integer;>;"
    .end local v41    # "xSet":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v47    # "ySet":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_2f6
    invoke-virtual/range {v42 .. v42}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v52

    invoke-interface/range {v52 .. v52}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v20

    :cond_2fe
    :goto_2fe
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v52

    if-eqz v52, :cond_1ad

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v41

    check-cast v41, Ljava/util/List;

    .line 248
    .restart local v41    # "xSet":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v46, Ljava/util/TreeSet;

    move-object/from16 v0, v46

    move-object/from16 v1, v41

    invoke-direct {v0, v1}, Ljava/util/TreeSet;-><init>(Ljava/util/Collection;)V

    .line 249
    .local v46, "yList":Ljava/util/TreeSet;, "Ljava/util/TreeSet<Ljava/lang/Integer;>;"
    new-instance v40, Ljava/util/TreeSet;

    move-object/from16 v0, v48

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/util/Collection;

    move-object/from16 v0, v40

    move-object/from16 v1, v52

    invoke-direct {v0, v1}, Ljava/util/TreeSet;-><init>(Ljava/util/Collection;)V

    .line 251
    .restart local v40    # "xList":Ljava/util/TreeSet;, "Ljava/util/TreeSet<Ljava/lang/Integer;>;"
    new-instance v28, Lorg/osmdroid/util/GEMFFile$GEMFRange;

    const/16 v52, 0x0

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    move-object/from16 v2, v52

    invoke-direct {v0, v1, v2}, Lorg/osmdroid/util/GEMFFile$GEMFRange;-><init>(Lorg/osmdroid/util/GEMFFile;Lorg/osmdroid/util/GEMFFile$1;)V

    .line 252
    .local v28, "range":Lorg/osmdroid/util/GEMFFile$GEMFRange;
    move-object/from16 v0, v51

    move-object/from16 v1, v28

    iput-object v0, v1, Lorg/osmdroid/util/GEMFFile$GEMFRange;->zoom:Ljava/lang/Integer;

    .line 253
    move-object/from16 v0, v34

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/lang/Integer;

    move-object/from16 v0, v52

    move-object/from16 v1, v28

    iput-object v0, v1, Lorg/osmdroid/util/GEMFFile$GEMFRange;->sourceIndex:Ljava/lang/Integer;

    .line 254
    invoke-virtual/range {v40 .. v40}, Ljava/util/TreeSet;->first()Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/lang/Integer;

    move-object/from16 v0, v52

    move-object/from16 v1, v28

    iput-object v0, v1, Lorg/osmdroid/util/GEMFFile$GEMFRange;->xMin:Ljava/lang/Integer;

    .line 255
    invoke-virtual/range {v40 .. v40}, Ljava/util/TreeSet;->last()Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/lang/Integer;

    move-object/from16 v0, v52

    move-object/from16 v1, v28

    iput-object v0, v1, Lorg/osmdroid/util/GEMFFile$GEMFRange;->xMax:Ljava/lang/Integer;

    .line 257
    invoke-virtual/range {v46 .. v46}, Ljava/util/TreeSet;->first()Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/lang/Integer;

    invoke-virtual/range {v52 .. v52}, Ljava/lang/Integer;->intValue()I

    move-result v17

    .restart local v17    # "i":I
    :goto_36b
    invoke-virtual/range {v46 .. v46}, Ljava/util/TreeSet;->last()Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/lang/Integer;

    invoke-virtual/range {v52 .. v52}, Ljava/lang/Integer;->intValue()I

    move-result v52

    add-int/lit8 v52, v52, 0x1

    move/from16 v0, v17

    move/from16 v1, v52

    if-ge v0, v1, :cond_3fa

    .line 258
    new-instance v52, Ljava/lang/Integer;

    move-object/from16 v0, v52

    move/from16 v1, v17

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    move-object/from16 v0, v46

    move-object/from16 v1, v52

    invoke-virtual {v0, v1}, Ljava/util/TreeSet;->contains(Ljava/lang/Object;)Z

    move-result v52

    if-eqz v52, :cond_3af

    .line 259
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->yMin:Ljava/lang/Integer;

    move-object/from16 v52, v0

    if-nez v52, :cond_3a2

    .line 260
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v52

    move-object/from16 v0, v52

    move-object/from16 v1, v28

    iput-object v0, v1, Lorg/osmdroid/util/GEMFFile$GEMFRange;->yMin:Ljava/lang/Integer;

    .line 262
    :cond_3a2
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v52

    move-object/from16 v0, v52

    move-object/from16 v1, v28

    iput-object v0, v1, Lorg/osmdroid/util/GEMFFile$GEMFRange;->yMax:Ljava/lang/Integer;

    .line 257
    :cond_3ac
    :goto_3ac
    add-int/lit8 v17, v17, 0x1

    goto :goto_36b

    .line 265
    :cond_3af
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->yMin:Ljava/lang/Integer;

    move-object/from16 v52, v0

    if-eqz v52, :cond_3ac

    .line 266
    move-object/from16 v0, v29

    move-object/from16 v1, v28

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 268
    new-instance v28, Lorg/osmdroid/util/GEMFFile$GEMFRange;

    .end local v28    # "range":Lorg/osmdroid/util/GEMFFile$GEMFRange;
    const/16 v52, 0x0

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    move-object/from16 v2, v52

    invoke-direct {v0, v1, v2}, Lorg/osmdroid/util/GEMFFile$GEMFRange;-><init>(Lorg/osmdroid/util/GEMFFile;Lorg/osmdroid/util/GEMFFile$1;)V

    .line 269
    .restart local v28    # "range":Lorg/osmdroid/util/GEMFFile$GEMFRange;
    move-object/from16 v0, v51

    move-object/from16 v1, v28

    iput-object v0, v1, Lorg/osmdroid/util/GEMFFile$GEMFRange;->zoom:Ljava/lang/Integer;

    .line 270
    move-object/from16 v0, v34

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/lang/Integer;

    move-object/from16 v0, v52

    move-object/from16 v1, v28

    iput-object v0, v1, Lorg/osmdroid/util/GEMFFile$GEMFRange;->sourceIndex:Ljava/lang/Integer;

    .line 271
    invoke-virtual/range {v40 .. v40}, Ljava/util/TreeSet;->first()Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/lang/Integer;

    move-object/from16 v0, v52

    move-object/from16 v1, v28

    iput-object v0, v1, Lorg/osmdroid/util/GEMFFile$GEMFRange;->xMin:Ljava/lang/Integer;

    .line 272
    invoke-virtual/range {v40 .. v40}, Ljava/util/TreeSet;->last()Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/lang/Integer;

    move-object/from16 v0, v52

    move-object/from16 v1, v28

    iput-object v0, v1, Lorg/osmdroid/util/GEMFFile$GEMFRange;->xMax:Ljava/lang/Integer;

    goto :goto_3ac

    .line 277
    :cond_3fa
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->yMin:Ljava/lang/Integer;

    move-object/from16 v52, v0

    if-eqz v52, :cond_2fe

    .line 278
    move-object/from16 v0, v29

    move-object/from16 v1, v28

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2fe

    .line 286
    .end local v17    # "i":I
    .end local v20    # "i$":Ljava/util/Iterator;
    .end local v28    # "range":Lorg/osmdroid/util/GEMFFile$GEMFRange;
    .end local v32    # "source":Ljava/lang/String;
    .end local v40    # "xList":Ljava/util/TreeSet;, "Ljava/util/TreeSet<Ljava/lang/Integer;>;"
    .end local v41    # "xSet":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v42    # "xSets":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/util/List<Ljava/lang/Integer;>;Ljava/util/List<Ljava/lang/Integer;>;>;"
    .end local v46    # "yList":Ljava/util/TreeSet;, "Ljava/util/TreeSet<Ljava/lang/Integer;>;"
    .end local v48    # "ySets":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/util/List<Ljava/lang/Integer;>;Ljava/util/List<Ljava/lang/Integer;>;>;"
    .end local v51    # "zoom":Ljava/lang/Integer;
    :cond_40b
    const/16 v35, 0x0

    .line 287
    .local v35, "source_list_size":I
    invoke-virtual/range {v34 .. v34}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v52

    invoke-interface/range {v52 .. v52}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v18

    .restart local v18    # "i$":Ljava/util/Iterator;
    :goto_415
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v52

    if-eqz v52, :cond_42a

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Ljava/lang/String;

    .line 288
    .restart local v32    # "source":Ljava/lang/String;
    invoke-virtual/range {v32 .. v32}, Ljava/lang/String;->length()I

    move-result v52

    add-int/lit8 v52, v52, 0x8

    add-int v35, v35, v52

    .line 289
    goto :goto_415

    .line 291
    .end local v32    # "source":Ljava/lang/String;
    :cond_42a
    add-int/lit8 v52, v35, 0xc

    invoke-interface/range {v29 .. v29}, Ljava/util/List;->size()I

    move-result v53

    mul-int/lit8 v53, v53, 0x20

    add-int v52, v52, v53

    add-int/lit8 v52, v52, 0x4

    move/from16 v0, v52

    int-to-long v0, v0

    move-wide/from16 v26, v0

    .line 300
    .local v26, "offset":J
    invoke-interface/range {v29 .. v29}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :cond_43f
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v52

    if-eqz v52, :cond_497

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lorg/osmdroid/util/GEMFFile$GEMFRange;

    .line 301
    .restart local v28    # "range":Lorg/osmdroid/util/GEMFFile$GEMFRange;
    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v52

    move-object/from16 v0, v52

    move-object/from16 v1, v28

    iput-object v0, v1, Lorg/osmdroid/util/GEMFFile$GEMFRange;->offset:Ljava/lang/Long;

    .line 303
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->xMin:Ljava/lang/Integer;

    move-object/from16 v52, v0

    invoke-virtual/range {v52 .. v52}, Ljava/lang/Integer;->intValue()I

    move-result v37

    .local v37, "x":I
    :goto_45f
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->xMax:Ljava/lang/Integer;

    move-object/from16 v52, v0

    invoke-virtual/range {v52 .. v52}, Ljava/lang/Integer;->intValue()I

    move-result v52

    add-int/lit8 v52, v52, 0x1

    move/from16 v0, v37

    move/from16 v1, v52

    if-ge v0, v1, :cond_43f

    .line 304
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->yMin:Ljava/lang/Integer;

    move-object/from16 v52, v0

    invoke-virtual/range {v52 .. v52}, Ljava/lang/Integer;->intValue()I

    move-result v43

    .local v43, "y":I
    :goto_47b
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->yMax:Ljava/lang/Integer;

    move-object/from16 v52, v0

    invoke-virtual/range {v52 .. v52}, Ljava/lang/Integer;->intValue()I

    move-result v52

    add-int/lit8 v52, v52, 0x1

    move/from16 v0, v43

    move/from16 v1, v52

    if-ge v0, v1, :cond_494

    .line 305
    const-wide/16 v52, 0xc

    add-long v26, v26, v52

    .line 304
    add-int/lit8 v43, v43, 0x1

    goto :goto_47b

    .line 303
    :cond_494
    add-int/lit8 v37, v37, 0x1

    goto :goto_45f

    .line 310
    .end local v28    # "range":Lorg/osmdroid/util/GEMFFile$GEMFRange;
    .end local v37    # "x":I
    .end local v43    # "y":I
    :cond_497
    move-wide/from16 v15, v26

    .line 312
    .local v15, "headerSize":J
    new-instance v14, Ljava/io/RandomAccessFile;

    const-string v52, "rw"

    move-object/from16 v0, p1

    move-object/from16 v1, v52

    invoke-direct {v14, v0, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 315
    .local v14, "gemfFile":Ljava/io/RandomAccessFile;
    const/16 v52, 0x4

    move/from16 v0, v52

    invoke-virtual {v14, v0}, Ljava/io/RandomAccessFile;->writeInt(I)V

    .line 318
    const/16 v52, 0x100

    move/from16 v0, v52

    invoke-virtual {v14, v0}, Ljava/io/RandomAccessFile;->writeInt(I)V

    .line 321
    invoke-virtual/range {v34 .. v34}, Ljava/util/LinkedHashMap;->size()I

    move-result v52

    move/from16 v0, v52

    invoke-virtual {v14, v0}, Ljava/io/RandomAccessFile;->writeInt(I)V

    .line 324
    invoke-virtual/range {v34 .. v34}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v52

    invoke-interface/range {v52 .. v52}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :goto_4c3
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v52

    if-eqz v52, :cond_4f5

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Ljava/lang/String;

    .line 325
    .restart local v32    # "source":Ljava/lang/String;
    move-object/from16 v0, v34

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/lang/Integer;

    invoke-virtual/range {v52 .. v52}, Ljava/lang/Integer;->intValue()I

    move-result v52

    move/from16 v0, v52

    invoke-virtual {v14, v0}, Ljava/io/RandomAccessFile;->writeInt(I)V

    .line 326
    invoke-virtual/range {v32 .. v32}, Ljava/lang/String;->length()I

    move-result v52

    move/from16 v0, v52

    invoke-virtual {v14, v0}, Ljava/io/RandomAccessFile;->writeInt(I)V

    .line 327
    invoke-virtual/range {v32 .. v32}, Ljava/lang/String;->getBytes()[B

    move-result-object v52

    move-object/from16 v0, v52

    invoke-virtual {v14, v0}, Ljava/io/RandomAccessFile;->write([B)V

    goto :goto_4c3

    .line 331
    .end local v32    # "source":Ljava/lang/String;
    :cond_4f5
    invoke-interface/range {v29 .. v29}, Ljava/util/List;->size()I

    move-result v52

    move/from16 v0, v52

    invoke-virtual {v14, v0}, Ljava/io/RandomAccessFile;->writeInt(I)V

    .line 334
    invoke-interface/range {v29 .. v29}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :goto_502
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v52

    if-eqz v52, :cond_578

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lorg/osmdroid/util/GEMFFile$GEMFRange;

    .line 335
    .restart local v28    # "range":Lorg/osmdroid/util/GEMFFile$GEMFRange;
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->zoom:Ljava/lang/Integer;

    move-object/from16 v52, v0

    invoke-virtual/range {v52 .. v52}, Ljava/lang/Integer;->intValue()I

    move-result v52

    move/from16 v0, v52

    invoke-virtual {v14, v0}, Ljava/io/RandomAccessFile;->writeInt(I)V

    .line 336
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->xMin:Ljava/lang/Integer;

    move-object/from16 v52, v0

    invoke-virtual/range {v52 .. v52}, Ljava/lang/Integer;->intValue()I

    move-result v52

    move/from16 v0, v52

    invoke-virtual {v14, v0}, Ljava/io/RandomAccessFile;->writeInt(I)V

    .line 337
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->xMax:Ljava/lang/Integer;

    move-object/from16 v52, v0

    invoke-virtual/range {v52 .. v52}, Ljava/lang/Integer;->intValue()I

    move-result v52

    move/from16 v0, v52

    invoke-virtual {v14, v0}, Ljava/io/RandomAccessFile;->writeInt(I)V

    .line 338
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->yMin:Ljava/lang/Integer;

    move-object/from16 v52, v0

    invoke-virtual/range {v52 .. v52}, Ljava/lang/Integer;->intValue()I

    move-result v52

    move/from16 v0, v52

    invoke-virtual {v14, v0}, Ljava/io/RandomAccessFile;->writeInt(I)V

    .line 339
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->yMax:Ljava/lang/Integer;

    move-object/from16 v52, v0

    invoke-virtual/range {v52 .. v52}, Ljava/lang/Integer;->intValue()I

    move-result v52

    move/from16 v0, v52

    invoke-virtual {v14, v0}, Ljava/io/RandomAccessFile;->writeInt(I)V

    .line 340
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->sourceIndex:Ljava/lang/Integer;

    move-object/from16 v52, v0

    invoke-virtual/range {v52 .. v52}, Ljava/lang/Integer;->intValue()I

    move-result v52

    move/from16 v0, v52

    invoke-virtual {v14, v0}, Ljava/io/RandomAccessFile;->writeInt(I)V

    .line 341
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->offset:Ljava/lang/Long;

    move-object/from16 v52, v0

    invoke-virtual/range {v52 .. v52}, Ljava/lang/Long;->longValue()J

    move-result-wide v52

    move-wide/from16 v0, v52

    invoke-virtual {v14, v0, v1}, Ljava/io/RandomAccessFile;->writeLong(J)V

    goto :goto_502

    .line 345
    .end local v28    # "range":Lorg/osmdroid/util/GEMFFile$GEMFRange;
    :cond_578
    invoke-interface/range {v29 .. v29}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :cond_57c
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v52

    if-eqz v52, :cond_60f

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lorg/osmdroid/util/GEMFFile$GEMFRange;

    .line 346
    .restart local v28    # "range":Lorg/osmdroid/util/GEMFFile$GEMFRange;
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->xMin:Ljava/lang/Integer;

    move-object/from16 v52, v0

    invoke-virtual/range {v52 .. v52}, Ljava/lang/Integer;->intValue()I

    move-result v37

    .restart local v37    # "x":I
    :goto_592
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->xMax:Ljava/lang/Integer;

    move-object/from16 v52, v0

    invoke-virtual/range {v52 .. v52}, Ljava/lang/Integer;->intValue()I

    move-result v52

    add-int/lit8 v52, v52, 0x1

    move/from16 v0, v37

    move/from16 v1, v52

    if-ge v0, v1, :cond_57c

    .line 347
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->yMin:Ljava/lang/Integer;

    move-object/from16 v52, v0

    invoke-virtual/range {v52 .. v52}, Ljava/lang/Integer;->intValue()I

    move-result v43

    .restart local v43    # "y":I
    :goto_5ae
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->yMax:Ljava/lang/Integer;

    move-object/from16 v52, v0

    invoke-virtual/range {v52 .. v52}, Ljava/lang/Integer;->intValue()I

    move-result v52

    add-int/lit8 v52, v52, 0x1

    move/from16 v0, v43

    move/from16 v1, v52

    if-ge v0, v1, :cond_60c

    .line 348
    move-wide/from16 v0, v26

    invoke-virtual {v14, v0, v1}, Ljava/io/RandomAccessFile;->writeLong(J)V

    .line 349
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->sourceIndex:Ljava/lang/Integer;

    move-object/from16 v52, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v52

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    move-object/from16 v0, v52

    invoke-virtual {v9, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/util/LinkedHashMap;

    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->zoom:Ljava/lang/Integer;

    move-object/from16 v53, v0

    invoke-virtual/range {v52 .. v53}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/util/LinkedHashMap;

    invoke-static/range {v37 .. v37}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v53

    invoke-virtual/range {v52 .. v53}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/util/LinkedHashMap;

    invoke-static/range {v43 .. v43}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v53

    invoke-virtual/range {v52 .. v53}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/io/File;

    invoke-virtual/range {v52 .. v52}, Ljava/io/File;->length()J

    move-result-wide v12

    .line 352
    .local v12, "fileSize":J
    long-to-int v0, v12

    move/from16 v52, v0

    move/from16 v0, v52

    invoke-virtual {v14, v0}, Ljava/io/RandomAccessFile;->writeInt(I)V

    .line 353
    add-long v26, v26, v12

    .line 347
    add-int/lit8 v43, v43, 0x1

    goto :goto_5ae

    .line 346
    .end local v12    # "fileSize":J
    :cond_60c
    add-int/lit8 v37, v37, 0x1

    goto :goto_592

    .line 362
    .end local v28    # "range":Lorg/osmdroid/util/GEMFFile$GEMFRange;
    .end local v37    # "x":I
    .end local v43    # "y":I
    :cond_60f
    const/16 v52, 0x400

    move/from16 v0, v52

    new-array v6, v0, [B

    .line 364
    .local v6, "buf":[B
    move-wide v7, v15

    .line 365
    .local v7, "currentOffset":J
    const/4 v11, 0x0

    .line 367
    .local v11, "fileIndex":I
    invoke-interface/range {v29 .. v29}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :cond_61b
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v52

    if-eqz v52, :cond_74b

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lorg/osmdroid/util/GEMFFile$GEMFRange;

    .line 368
    .restart local v28    # "range":Lorg/osmdroid/util/GEMFFile$GEMFRange;
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->xMin:Ljava/lang/Integer;

    move-object/from16 v52, v0

    invoke-virtual/range {v52 .. v52}, Ljava/lang/Integer;->intValue()I

    move-result v37

    .restart local v37    # "x":I
    :goto_631
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->xMax:Ljava/lang/Integer;

    move-object/from16 v52, v0

    invoke-virtual/range {v52 .. v52}, Ljava/lang/Integer;->intValue()I

    move-result v52

    add-int/lit8 v52, v52, 0x1

    move/from16 v0, v37

    move/from16 v1, v52

    if-ge v0, v1, :cond_61b

    .line 369
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->yMin:Ljava/lang/Integer;

    move-object/from16 v52, v0

    invoke-virtual/range {v52 .. v52}, Ljava/lang/Integer;->intValue()I

    move-result v43

    .restart local v43    # "y":I
    :goto_64d
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->yMax:Ljava/lang/Integer;

    move-object/from16 v52, v0

    invoke-virtual/range {v52 .. v52}, Ljava/lang/Integer;->intValue()I

    move-result v52

    add-int/lit8 v52, v52, 0x1

    move/from16 v0, v43

    move/from16 v1, v52

    if-ge v0, v1, :cond_747

    .line 371
    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->sourceIndex:Ljava/lang/Integer;

    move-object/from16 v52, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v52

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    move-object/from16 v0, v52

    invoke-virtual {v9, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/util/LinkedHashMap;

    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->zoom:Ljava/lang/Integer;

    move-object/from16 v53, v0

    invoke-virtual/range {v52 .. v53}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/util/LinkedHashMap;

    invoke-static/range {v37 .. v37}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v53

    invoke-virtual/range {v52 .. v53}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/util/LinkedHashMap;

    invoke-static/range {v43 .. v43}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v53

    invoke-virtual/range {v52 .. v53}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/io/File;

    invoke-virtual/range {v52 .. v52}, Ljava/io/File;->length()J

    move-result-wide v12

    .line 374
    .restart local v12    # "fileSize":J
    add-long v52, v7, v12

    const-wide/32 v54, 0x40000000

    cmp-long v52, v52, v54

    if-lez v52, :cond_73e

    .line 375
    invoke-virtual {v14}, Ljava/io/RandomAccessFile;->close()V

    .line 376
    add-int/lit8 v11, v11, 0x1

    .line 377
    new-instance v14, Ljava/io/RandomAccessFile;

    .end local v14    # "gemfFile":Ljava/io/RandomAccessFile;
    new-instance v52, Ljava/lang/StringBuilder;

    invoke-direct/range {v52 .. v52}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v52

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v52

    const-string v53, "-"

    invoke-virtual/range {v52 .. v53}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v52

    move-object/from16 v0, v52

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v52

    invoke-virtual/range {v52 .. v52}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v52

    const-string v53, "rw"

    move-object/from16 v0, v52

    move-object/from16 v1, v53

    invoke-direct {v14, v0, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 378
    .restart local v14    # "gemfFile":Ljava/io/RandomAccessFile;
    const-wide/16 v7, 0x0

    .line 383
    :goto_6d1
    new-instance v36, Ljava/io/FileInputStream;

    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->sourceIndex:Ljava/lang/Integer;

    move-object/from16 v52, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v52

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    move-object/from16 v0, v52

    invoke-virtual {v9, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/util/LinkedHashMap;

    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->zoom:Ljava/lang/Integer;

    move-object/from16 v53, v0

    invoke-virtual/range {v52 .. v53}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/util/LinkedHashMap;

    invoke-static/range {v37 .. v37}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v53

    invoke-virtual/range {v52 .. v53}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/util/LinkedHashMap;

    invoke-static/range {v43 .. v43}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v53

    invoke-virtual/range {v52 .. v53}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v52

    check-cast v52, Ljava/io/File;

    move-object/from16 v0, v36

    move-object/from16 v1, v52

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 388
    .local v36, "tile":Ljava/io/FileInputStream;
    const/16 v52, 0x0

    const/16 v53, 0x400

    move-object/from16 v0, v36

    move/from16 v1, v52

    move/from16 v2, v53

    invoke-virtual {v0, v6, v1, v2}, Ljava/io/FileInputStream;->read([BII)I

    move-result v30

    .line 389
    .local v30, "read":I
    :goto_71e
    const/16 v52, -0x1

    move/from16 v0, v30

    move/from16 v1, v52

    if-eq v0, v1, :cond_740

    .line 390
    const/16 v52, 0x0

    move/from16 v0, v52

    move/from16 v1, v30

    invoke-virtual {v14, v6, v0, v1}, Ljava/io/RandomAccessFile;->write([BII)V

    .line 391
    const/16 v52, 0x0

    const/16 v53, 0x400

    move-object/from16 v0, v36

    move/from16 v1, v52

    move/from16 v2, v53

    invoke-virtual {v0, v6, v1, v2}, Ljava/io/FileInputStream;->read([BII)I

    move-result v30

    goto :goto_71e

    .line 380
    .end local v30    # "read":I
    .end local v36    # "tile":Ljava/io/FileInputStream;
    :cond_73e
    add-long/2addr v7, v12

    goto :goto_6d1

    .line 394
    .restart local v30    # "read":I
    .restart local v36    # "tile":Ljava/io/FileInputStream;
    :cond_740
    invoke-virtual/range {v36 .. v36}, Ljava/io/FileInputStream;->close()V

    .line 369
    add-int/lit8 v43, v43, 0x1

    goto/16 :goto_64d

    .line 368
    .end local v12    # "fileSize":J
    .end local v30    # "read":I
    .end local v36    # "tile":Ljava/io/FileInputStream;
    :cond_747
    add-int/lit8 v37, v37, 0x1

    goto/16 :goto_631

    .line 399
    .end local v28    # "range":Lorg/osmdroid/util/GEMFFile$GEMFRange;
    .end local v37    # "x":I
    .end local v43    # "y":I
    :cond_74b
    invoke-virtual {v14}, Ljava/io/RandomAccessFile;->close()V

    .line 402
    invoke-direct/range {p0 .. p0}, Lorg/osmdroid/util/GEMFFile;->openFiles()V

    .line 403
    invoke-direct/range {p0 .. p0}, Lorg/osmdroid/util/GEMFFile;->readHeader()V

    .line 404
    return-void
.end method

.method private openFiles()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 429
    new-instance v0, Ljava/io/File;

    iget-object v3, p0, Lorg/osmdroid/util/GEMFFile;->mLocation:Ljava/lang/String;

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 430
    .local v0, "base":Ljava/io/File;
    iget-object v3, p0, Lorg/osmdroid/util/GEMFFile;->mFiles:Ljava/util/List;

    new-instance v4, Ljava/io/RandomAccessFile;

    const-string v5, "r"

    invoke-direct {v4, v0, v5}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 431
    iget-object v3, p0, Lorg/osmdroid/util/GEMFFile;->mFileNames:Ljava/util/List;

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 433
    const/4 v1, 0x0

    .line 435
    .local v1, "i":I
    :goto_1d
    add-int/lit8 v1, v1, 0x1

    .line 436
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lorg/osmdroid/util/GEMFFile;->mLocation:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 437
    .local v2, "nextFile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_59

    .line 438
    iget-object v3, p0, Lorg/osmdroid/util/GEMFFile;->mFiles:Ljava/util/List;

    new-instance v4, Ljava/io/RandomAccessFile;

    const-string v5, "r"

    invoke-direct {v4, v2, v5}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 439
    iget-object v3, p0, Lorg/osmdroid/util/GEMFFile;->mFileNames:Ljava/util/List;

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1d

    .line 444
    :cond_59
    return-void
.end method

.method private readHeader()V
    .registers 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 451
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/osmdroid/util/GEMFFile;->mFiles:Ljava/util/List;

    const/4 v15, 0x0

    invoke-interface {v14, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/RandomAccessFile;

    .line 454
    .local v1, "baseFile":Ljava/io/RandomAccessFile;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/osmdroid/util/GEMFFile;->mFiles:Ljava/util/List;

    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_13
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_2f

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/RandomAccessFile;

    .line 455
    .local v2, "file":Ljava/io/RandomAccessFile;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/osmdroid/util/GEMFFile;->mFileSizes:Ljava/util/List;

    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v15

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v15

    invoke-interface {v14, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_13

    .line 459
    .end local v2    # "file":Ljava/io/RandomAccessFile;
    :cond_2f
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v13

    .line 460
    .local v13, "version":I
    const/4 v14, 0x4

    if-eq v13, v14, :cond_4f

    .line 461
    new-instance v14, Ljava/io/IOException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Bad file version: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 465
    :cond_4f
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v12

    .line 466
    .local v12, "tile_size":I
    const/16 v14, 0x100

    if-eq v12, v14, :cond_70

    .line 467
    new-instance v14, Ljava/io/IOException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Bad tile size: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 471
    :cond_70
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v8

    .line 473
    .local v8, "sourceCount":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_75
    if-ge v3, v8, :cond_99

    .line 474
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v9

    .line 475
    .local v9, "sourceIndex":I
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v11

    .line 476
    .local v11, "sourceNameLength":I
    new-array v5, v11, [B

    .line 477
    .local v5, "nameData":[B
    const/4 v14, 0x0

    invoke-virtual {v1, v5, v14, v11}, Ljava/io/RandomAccessFile;->read([BII)I

    .line 479
    new-instance v10, Ljava/lang/String;

    invoke-direct {v10, v5}, Ljava/lang/String;-><init>([B)V

    .line 480
    .local v10, "sourceName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/osmdroid/util/GEMFFile;->mSources:Ljava/util/LinkedHashMap;

    new-instance v15, Ljava/lang/Integer;

    invoke-direct {v15, v9}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v14, v15, v10}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 473
    add-int/lit8 v3, v3, 0x1

    goto :goto_75

    .line 484
    .end local v5    # "nameData":[B
    .end local v9    # "sourceIndex":I
    .end local v10    # "sourceName":Ljava/lang/String;
    .end local v11    # "sourceNameLength":I
    :cond_99
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v6

    .line 485
    .local v6, "num_ranges":I
    const/4 v3, 0x0

    :goto_9e
    if-ge v3, v6, :cond_f8

    .line 486
    new-instance v7, Lorg/osmdroid/util/GEMFFile$GEMFRange;

    const/4 v14, 0x0

    move-object/from16 v0, p0

    invoke-direct {v7, v0, v14}, Lorg/osmdroid/util/GEMFFile$GEMFRange;-><init>(Lorg/osmdroid/util/GEMFFile;Lorg/osmdroid/util/GEMFFile$1;)V

    .line 487
    .local v7, "rs":Lorg/osmdroid/util/GEMFFile$GEMFRange;
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    iput-object v14, v7, Lorg/osmdroid/util/GEMFFile$GEMFRange;->zoom:Ljava/lang/Integer;

    .line 488
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    iput-object v14, v7, Lorg/osmdroid/util/GEMFFile$GEMFRange;->xMin:Ljava/lang/Integer;

    .line 489
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    iput-object v14, v7, Lorg/osmdroid/util/GEMFFile$GEMFRange;->xMax:Ljava/lang/Integer;

    .line 490
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    iput-object v14, v7, Lorg/osmdroid/util/GEMFFile$GEMFRange;->yMin:Ljava/lang/Integer;

    .line 491
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    iput-object v14, v7, Lorg/osmdroid/util/GEMFFile$GEMFRange;->yMax:Ljava/lang/Integer;

    .line 492
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    iput-object v14, v7, Lorg/osmdroid/util/GEMFFile$GEMFRange;->sourceIndex:Ljava/lang/Integer;

    .line 493
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->readLong()J

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    iput-object v14, v7, Lorg/osmdroid/util/GEMFFile$GEMFRange;->offset:Ljava/lang/Long;

    .line 494
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/osmdroid/util/GEMFFile;->mRangeData:Ljava/util/List;

    invoke-interface {v14, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 485
    add-int/lit8 v3, v3, 0x1

    goto :goto_9e

    .line 496
    .end local v7    # "rs":Lorg/osmdroid/util/GEMFFile$GEMFRange;
    :cond_f8
    return-void
.end method


# virtual methods
.method public acceptAnySource()V
    .registers 2

    .prologue
    .line 533
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/osmdroid/util/GEMFFile;->mSourceLimited:Z

    .line 534
    return-void
.end method

.method public close()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 416
    iget-object v2, p0, Lorg/osmdroid/util/GEMFFile;->mFiles:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/RandomAccessFile;

    .line 417
    .local v0, "file":Ljava/io/RandomAccessFile;
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    goto :goto_6

    .line 419
    .end local v0    # "file":Ljava/io/RandomAccessFile;
    :cond_16
    return-void
.end method

.method public getInputStream(III)Ljava/io/InputStream;
    .registers 24
    .param p1, "pX"    # I
    .param p2, "pY"    # I
    .param p3, "pZ"    # I

    .prologue
    .line 555
    const/16 v16, 0x0

    .line 557
    .local v16, "range":Lorg/osmdroid/util/GEMFFile$GEMFRange;
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/osmdroid/util/GEMFFile;->mRangeData:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "i$":Ljava/util/Iterator;
    :cond_a
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_68

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lorg/osmdroid/util/GEMFFile$GEMFRange;

    .line 559
    .local v17, "rs":Lorg/osmdroid/util/GEMFFile$GEMFRange;
    move-object/from16 v0, v17

    iget-object v1, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->zoom:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    move/from16 v0, p3

    if-ne v0, v1, :cond_a

    move-object/from16 v0, v17

    iget-object v1, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->xMin:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    move/from16 v0, p1

    if-lt v0, v1, :cond_a

    move-object/from16 v0, v17

    iget-object v1, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->xMax:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    move/from16 v0, p1

    if-gt v0, v1, :cond_a

    move-object/from16 v0, v17

    iget-object v1, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->yMin:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    move/from16 v0, p2

    if-lt v0, v1, :cond_a

    move-object/from16 v0, v17

    iget-object v1, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->yMax:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    move/from16 v0, p2

    if-gt v0, v1, :cond_a

    move-object/from16 v0, p0

    iget-boolean v1, v0, Lorg/osmdroid/util/GEMFFile;->mSourceLimited:Z

    if-eqz v1, :cond_66

    move-object/from16 v0, v17

    iget-object v1, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->sourceIndex:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    move-object/from16 v0, p0

    iget v2, v0, Lorg/osmdroid/util/GEMFFile;->mCurrentSource:I

    if-ne v1, v2, :cond_a

    .line 565
    :cond_66
    move-object/from16 v16, v17

    .line 570
    .end local v17    # "rs":Lorg/osmdroid/util/GEMFFile$GEMFRange;
    :cond_68
    if-nez v16, :cond_6c

    .line 571
    const/4 v1, 0x0

    .line 616
    :goto_6b
    return-object v1

    .line 580
    :cond_6c
    :try_start_6c
    move-object/from16 v0, v16

    iget-object v1, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->yMax:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    move-object/from16 v0, v16

    iget-object v2, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->yMin:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    sub-int v12, v1, v2

    .line 581
    .local v12, "numY":I
    move-object/from16 v0, v16

    iget-object v1, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->xMin:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sub-int v18, p1, v1

    .line 582
    .local v18, "xIndex":I
    move-object/from16 v0, v16

    iget-object v1, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->yMin:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sub-int v19, p2, v1

    .line 583
    .local v19, "yIndex":I
    mul-int v1, v18, v12

    add-int v1, v1, v19

    int-to-long v13, v1

    .line 584
    .local v13, "offset":J
    const-wide/16 v1, 0xc

    mul-long/2addr v13, v1

    .line 585
    move-object/from16 v0, v16

    iget-object v1, v0, Lorg/osmdroid/util/GEMFFile$GEMFRange;->offset:Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    add-long/2addr v13, v1

    .line 589
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/osmdroid/util/GEMFFile;->mFiles:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/io/RandomAccessFile;

    .line 590
    .local v7, "baseFile":Ljava/io/RandomAccessFile;
    invoke-virtual {v7, v13, v14}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 591
    invoke-virtual {v7}, Ljava/io/RandomAccessFile;->readLong()J

    move-result-wide v4

    .line 592
    .local v4, "dataOffset":J
    invoke-virtual {v7}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v6

    .line 595
    .local v6, "dataLength":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/osmdroid/util/GEMFFile;->mFiles:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/io/RandomAccessFile;

    .line 596
    .local v15, "pDataFile":Ljava/io/RandomAccessFile;
    const/4 v11, 0x0

    .line 597
    .local v11, "index":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/osmdroid/util/GEMFFile;->mFileSizes:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    cmp-long v1, v4, v1

    if-lez v1, :cond_114

    .line 598
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/osmdroid/util/GEMFFile;->mFileSizes:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v9

    .line 600
    .local v9, "fileListCount":I
    :goto_e2
    add-int/lit8 v1, v9, -0x1

    if-ge v11, v1, :cond_10a

    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/osmdroid/util/GEMFFile;->mFileSizes:Ljava/util/List;

    invoke-interface {v1, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    cmp-long v1, v4, v1

    if-lez v1, :cond_10a

    .line 603
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/osmdroid/util/GEMFFile;->mFileSizes:Ljava/util/List;

    invoke-interface {v1, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    sub-long/2addr v4, v1

    .line 604
    add-int/lit8 v11, v11, 0x1

    goto :goto_e2

    .line 607
    :cond_10a
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/osmdroid/util/GEMFFile;->mFiles:Ljava/util/List;

    invoke-interface {v1, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    .end local v15    # "pDataFile":Ljava/io/RandomAccessFile;
    check-cast v15, Ljava/io/RandomAccessFile;

    .line 611
    .end local v9    # "fileListCount":I
    .restart local v15    # "pDataFile":Ljava/io/RandomAccessFile;
    :cond_114
    invoke-virtual {v15, v4, v5}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 613
    new-instance v1, Lorg/osmdroid/util/GEMFFile$GEMFInputStream;

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/osmdroid/util/GEMFFile;->mFileNames:Ljava/util/List;

    invoke-interface {v2, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object/from16 v2, p0

    invoke-direct/range {v1 .. v6}, Lorg/osmdroid/util/GEMFFile$GEMFInputStream;-><init>(Lorg/osmdroid/util/GEMFFile;Ljava/lang/String;JI)V
    :try_end_128
    .catch Ljava/io/IOException; {:try_start_6c .. :try_end_128} :catch_12a

    goto/16 :goto_6b

    .line 615
    .end local v4    # "dataOffset":J
    .end local v6    # "dataLength":I
    .end local v7    # "baseFile":Ljava/io/RandomAccessFile;
    .end local v11    # "index":I
    .end local v12    # "numY":I
    .end local v13    # "offset":J
    .end local v15    # "pDataFile":Ljava/io/RandomAccessFile;
    .end local v18    # "xIndex":I
    .end local v19    # "yIndex":I
    :catch_12a
    move-exception v8

    .line 616
    .local v8, "e":Ljava/io/IOException;
    const/4 v1, 0x0

    goto/16 :goto_6b
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 508
    iget-object v0, p0, Lorg/osmdroid/util/GEMFFile;->mLocation:Ljava/lang/String;

    return-object v0
.end method

.method public getSources()Ljava/util/LinkedHashMap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 515
    iget-object v0, p0, Lorg/osmdroid/util/GEMFFile;->mSources:Ljava/util/LinkedHashMap;

    return-object v0
.end method

.method public getZoomLevels()Ljava/util/Set;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 540
    new-instance v2, Ljava/util/TreeSet;

    invoke-direct {v2}, Ljava/util/TreeSet;-><init>()V

    .line 542
    .local v2, "zoomLevels":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    iget-object v3, p0, Lorg/osmdroid/util/GEMFFile;->mRangeData:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/util/GEMFFile$GEMFRange;

    .line 543
    .local v1, "rs":Lorg/osmdroid/util/GEMFFile$GEMFRange;
    iget-object v3, v1, Lorg/osmdroid/util/GEMFFile$GEMFRange;->zoom:Ljava/lang/Integer;

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 546
    .end local v1    # "rs":Lorg/osmdroid/util/GEMFFile$GEMFRange;
    :cond_1d
    return-object v2
.end method

.method public selectSource(I)V
    .registers 4
    .param p1, "pSource"    # I

    .prologue
    .line 523
    iget-object v0, p0, Lorg/osmdroid/util/GEMFFile;->mSources:Ljava/util/LinkedHashMap;

    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 524
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/osmdroid/util/GEMFFile;->mSourceLimited:Z

    .line 525
    iput p1, p0, Lorg/osmdroid/util/GEMFFile;->mCurrentSource:I

    .line 527
    :cond_12
    return-void
.end method
