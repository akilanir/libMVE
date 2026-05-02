.class public Lcom/drew/imaging/ImageMetadataReader;
.super Ljava/lang/Object;
.source "ImageMetadataReader.java"


# direct methods
.method private constructor <init>()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 172
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "Not intended for instantiation"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static main([Ljava/lang/String;)V
    .registers 38
    .param p0, "args"    # [Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/drew/metadata/MetadataException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 190
    new-instance v2, Ljava/util/ArrayList;

    invoke-static/range {p0 .. p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 191
    .local v2, "argList":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    const-string v29, "-thumb"

    move-object/from16 v0, v29

    invoke-interface {v2, v0}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v24

    .line 192
    .local v24, "thumbRequested":Z
    const-string v29, "-markdown"

    move-object/from16 v0, v29

    invoke-interface {v2, v0}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v16

    .line 193
    .local v16, "markdownFormat":Z
    const-string v29, "-hex"

    move-object/from16 v0, v29

    invoke-interface {v2, v0}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v19

    .line 195
    .local v19, "showHex":Z
    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v29

    const/16 v30, 0x1

    move/from16 v0, v29

    move/from16 v1, v30

    if-ge v0, v1, :cond_7a

    .line 196
    const-class v29, Lcom/drew/imaging/ImageMetadataReader;

    invoke-virtual/range {v29 .. v29}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/Package;->getImplementationVersion()Ljava/lang/String;

    move-result-object v28

    .line 197
    .local v28, "version":Ljava/lang/String;
    sget-object v29, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "metadata-extractor version "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 198
    sget-object v29, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual/range {v29 .. v29}, Ljava/io/PrintStream;->println()V

    .line 199
    sget-object v29, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v30, "Usage: java -jar metadata-extractor-%s.jar <filename> [<filename>] [-thumb] [-markdown] [-hex]"

    const/16 v31, 0x1

    move/from16 v0, v31

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v31, v0

    const/16 v32, 0x0

    if-nez v28, :cond_6c

    const-string v28, "a.b.c"

    .end local v28    # "version":Ljava/lang/String;
    :cond_6c
    aput-object v28, v31, v32

    invoke-static/range {v30 .. v31}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 200
    const/16 v29, 0x1

    invoke-static/range {v29 .. v29}, Ljava/lang/System;->exit(I)V

    .line 203
    :cond_7a
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_7e
    :goto_7e
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v29

    if-eqz v29, :cond_302

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 204
    .local v11, "filePath":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v20

    .line 205
    .local v20, "startTime":J
    new-instance v9, Ljava/io/File;

    invoke-direct {v9, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 207
    .local v9, "file":Ljava/io/File;
    if-nez v16, :cond_b4

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v29

    const/16 v30, 0x1

    move/from16 v0, v29

    move/from16 v1, v30

    if-le v0, v1, :cond_b4

    .line 208
    sget-object v29, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v30, "\n***** PROCESSING: %s\n%n"

    const/16 v31, 0x1

    move/from16 v0, v31

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v31, v0

    const/16 v32, 0x0

    aput-object v11, v31, v32

    invoke-virtual/range {v29 .. v31}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 210
    :cond_b4
    const/16 v17, 0x0

    .line 212
    .local v17, "metadata":Lcom/drew/metadata/Metadata;
    :try_start_b6
    invoke-static {v9}, Lcom/drew/imaging/ImageMetadataReader;->readMetadata(Ljava/io/File;)Lcom/drew/metadata/Metadata;
    :try_end_b9
    .catch Ljava/lang/Exception; {:try_start_b6 .. :try_end_b9} :catch_217

    move-result-object v17

    .line 217
    :goto_ba
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v29

    sub-long v25, v29, v20

    .line 218
    .local v25, "took":J
    if-nez v16, :cond_fa

    .line 219
    sget-object v29, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v30, "Processed %.3f MB file in %.2f ms%n%n"

    const/16 v31, 0x2

    move/from16 v0, v31

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v31, v0

    const/16 v32, 0x0

    invoke-virtual {v9}, Ljava/io/File;->length()J

    move-result-wide v33

    move-wide/from16 v0, v33

    long-to-double v0, v0

    move-wide/from16 v33, v0

    const-wide/high16 v35, 0x4130000000000000L    # 1048576.0

    div-double v33, v33, v35

    invoke-static/range {v33 .. v34}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v33

    aput-object v33, v31, v32

    const/16 v32, 0x1

    move-wide/from16 v0, v25

    long-to-double v0, v0

    move-wide/from16 v33, v0

    const-wide v35, 0x412e848000000000L    # 1000000.0

    div-double v33, v33, v35

    invoke-static/range {v33 .. v34}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v33

    aput-object v33, v31, v32

    invoke-virtual/range {v29 .. v31}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 221
    :cond_fa
    if-eqz v16, :cond_18c

    .line 222
    invoke-virtual {v9}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v10

    .line 223
    .local v10, "fileName":Ljava/lang/String;
    invoke-static {v11}, Lcom/drew/lang/StringUtil;->urlEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    .line 224
    .local v27, "urlName":Ljava/lang/String;
    const-class v29, Lcom/drew/metadata/exif/ExifIFD0Directory;

    move-object/from16 v0, v17

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lcom/drew/metadata/Metadata;->getFirstDirectoryOfType(Ljava/lang/Class;)Lcom/drew/metadata/Directory;

    move-result-object v8

    check-cast v8, Lcom/drew/metadata/exif/ExifIFD0Directory;

    .line 225
    .local v8, "exifIFD0Directory":Lcom/drew/metadata/exif/ExifIFD0Directory;
    if-nez v8, :cond_226

    const-string v15, ""

    .line 226
    .local v15, "make":Ljava/lang/String;
    :goto_114
    if-nez v8, :cond_230

    const-string v18, ""

    .line 227
    .local v18, "model":Ljava/lang/String;
    :goto_118
    sget-object v29, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual/range {v29 .. v29}, Ljava/io/PrintStream;->println()V

    .line 228
    sget-object v29, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v30, "---"

    invoke-virtual/range {v29 .. v30}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 229
    sget-object v29, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual/range {v29 .. v29}, Ljava/io/PrintStream;->println()V

    .line 230
    sget-object v29, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v30, "# %s - %s%n"

    const/16 v31, 0x2

    move/from16 v0, v31

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v31, v0

    const/16 v32, 0x0

    aput-object v15, v31, v32

    const/16 v32, 0x1

    aput-object v18, v31, v32

    invoke-virtual/range {v29 .. v31}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 231
    sget-object v29, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual/range {v29 .. v29}, Ljava/io/PrintStream;->println()V

    .line 232
    sget-object v29, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v30, "<a href=\"https://raw.githubusercontent.com/drewnoakes/metadata-extractor-images/master/%s\">%n"

    const/16 v31, 0x1

    move/from16 v0, v31

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v31, v0

    const/16 v32, 0x0

    aput-object v27, v31, v32

    invoke-virtual/range {v29 .. v31}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 233
    sget-object v29, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v30, "<img src=\"https://raw.githubusercontent.com/drewnoakes/metadata-extractor-images/master/%s\" width=\"300\"/><br/>%n"

    const/16 v31, 0x1

    move/from16 v0, v31

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v31, v0

    const/16 v32, 0x0

    aput-object v27, v31, v32

    invoke-virtual/range {v29 .. v31}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 234
    sget-object v29, Ljava/lang/System;->out:Ljava/io/PrintStream;

    move-object/from16 v0, v29

    invoke-virtual {v0, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 235
    sget-object v29, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v30, "</a>"

    invoke-virtual/range {v29 .. v30}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 236
    sget-object v29, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual/range {v29 .. v29}, Ljava/io/PrintStream;->println()V

    .line 237
    sget-object v29, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v30, "Directory | Tag Id | Tag Name | Extracted Value"

    invoke-virtual/range {v29 .. v30}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 238
    sget-object v29, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v30, ":--------:|-------:|----------|----------------"

    invoke-virtual/range {v29 .. v30}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 242
    .end local v8    # "exifIFD0Directory":Lcom/drew/metadata/exif/ExifIFD0Directory;
    .end local v10    # "fileName":Ljava/lang/String;
    .end local v15    # "make":Ljava/lang/String;
    .end local v18    # "model":Ljava/lang/String;
    .end local v27    # "urlName":Ljava/lang/String;
    :cond_18c
    invoke-virtual/range {v17 .. v17}, Lcom/drew/metadata/Metadata;->getDirectories()Ljava/lang/Iterable;

    move-result-object v29

    invoke-interface/range {v29 .. v29}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_194
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v29

    if-eqz v29, :cond_2ad

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/drew/metadata/Directory;

    .line 243
    .local v4, "directory":Lcom/drew/metadata/Directory;
    invoke-virtual {v4}, Lcom/drew/metadata/Directory;->getName()Ljava/lang/String;

    move-result-object v5

    .line 244
    .local v5, "directoryName":Ljava/lang/String;
    invoke-virtual {v4}, Lcom/drew/metadata/Directory;->getTags()Ljava/util/Collection;

    move-result-object v29

    invoke-interface/range {v29 .. v29}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .local v14, "i$":Ljava/util/Iterator;
    :goto_1ac
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v29

    if-eqz v29, :cond_27e

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lcom/drew/metadata/Tag;

    .line 245
    .local v22, "tag":Lcom/drew/metadata/Tag;
    invoke-virtual/range {v22 .. v22}, Lcom/drew/metadata/Tag;->getTagName()Ljava/lang/String;

    move-result-object v23

    .line 246
    .local v23, "tagName":Ljava/lang/String;
    invoke-virtual/range {v22 .. v22}, Lcom/drew/metadata/Tag;->getDescription()Ljava/lang/String;

    move-result-object v3

    .line 249
    .local v3, "description":Ljava/lang/String;
    if-eqz v3, :cond_1ed

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v29

    const/16 v30, 0x400

    move/from16 v0, v29

    move/from16 v1, v30

    if-le v0, v1, :cond_1ed

    .line 250
    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v30, 0x0

    const/16 v31, 0x400

    move/from16 v0, v30

    move/from16 v1, v31

    invoke-virtual {v3, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    const-string v30, "..."

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 253
    :cond_1ed
    if-eqz v16, :cond_23a

    .line 254
    sget-object v29, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v30, "%s|0x%s|%s|%s%n"

    const/16 v31, 0x4

    move/from16 v0, v31

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v31, v0

    const/16 v32, 0x0

    aput-object v5, v31, v32

    const/16 v32, 0x1

    invoke-virtual/range {v22 .. v22}, Lcom/drew/metadata/Tag;->getTagType()I

    move-result v33

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v33

    aput-object v33, v31, v32

    const/16 v32, 0x2

    aput-object v23, v31, v32

    const/16 v32, 0x3

    aput-object v3, v31, v32

    invoke-virtual/range {v29 .. v31}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    goto :goto_1ac

    .line 213
    .end local v3    # "description":Ljava/lang/String;
    .end local v4    # "directory":Lcom/drew/metadata/Directory;
    .end local v5    # "directoryName":Ljava/lang/String;
    .end local v14    # "i$":Ljava/util/Iterator;
    .end local v22    # "tag":Lcom/drew/metadata/Tag;
    .end local v23    # "tagName":Ljava/lang/String;
    .end local v25    # "took":J
    :catch_217
    move-exception v6

    .line 214
    .local v6, "e":Ljava/lang/Exception;
    sget-object v29, Ljava/lang/System;->err:Ljava/io/PrintStream;

    move-object/from16 v0, v29

    invoke-virtual {v6, v0}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintStream;)V

    .line 215
    const/16 v29, 0x1

    invoke-static/range {v29 .. v29}, Ljava/lang/System;->exit(I)V

    goto/16 :goto_ba

    .line 225
    .end local v6    # "e":Ljava/lang/Exception;
    .restart local v8    # "exifIFD0Directory":Lcom/drew/metadata/exif/ExifIFD0Directory;
    .restart local v10    # "fileName":Ljava/lang/String;
    .restart local v25    # "took":J
    .restart local v27    # "urlName":Ljava/lang/String;
    :cond_226
    const/16 v29, 0x10f

    move/from16 v0, v29

    invoke-virtual {v8, v0}, Lcom/drew/metadata/exif/ExifIFD0Directory;->getString(I)Ljava/lang/String;

    move-result-object v15

    goto/16 :goto_114

    .line 226
    .restart local v15    # "make":Ljava/lang/String;
    :cond_230
    const/16 v29, 0x110

    move/from16 v0, v29

    invoke-virtual {v8, v0}, Lcom/drew/metadata/exif/ExifIFD0Directory;->getString(I)Ljava/lang/String;

    move-result-object v18

    goto/16 :goto_118

    .line 261
    .end local v8    # "exifIFD0Directory":Lcom/drew/metadata/exif/ExifIFD0Directory;
    .end local v10    # "fileName":Ljava/lang/String;
    .end local v15    # "make":Ljava/lang/String;
    .end local v27    # "urlName":Ljava/lang/String;
    .restart local v3    # "description":Ljava/lang/String;
    .restart local v4    # "directory":Lcom/drew/metadata/Directory;
    .restart local v5    # "directoryName":Ljava/lang/String;
    .restart local v14    # "i$":Ljava/util/Iterator;
    .restart local v22    # "tag":Lcom/drew/metadata/Tag;
    .restart local v23    # "tagName":Ljava/lang/String;
    :cond_23a
    if-eqz v19, :cond_261

    .line 262
    sget-object v29, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v30, "[%s - %s] %s = %s%n"

    const/16 v31, 0x4

    move/from16 v0, v31

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v31, v0

    const/16 v32, 0x0

    aput-object v5, v31, v32

    const/16 v32, 0x1

    invoke-virtual/range {v22 .. v22}, Lcom/drew/metadata/Tag;->getTagTypeHex()Ljava/lang/String;

    move-result-object v33

    aput-object v33, v31, v32

    const/16 v32, 0x2

    aput-object v23, v31, v32

    const/16 v32, 0x3

    aput-object v3, v31, v32

    invoke-virtual/range {v29 .. v31}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    goto/16 :goto_1ac

    .line 264
    :cond_261
    sget-object v29, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v30, "[%s] %s = %s%n"

    const/16 v31, 0x3

    move/from16 v0, v31

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v31, v0

    const/16 v32, 0x0

    aput-object v5, v31, v32

    const/16 v32, 0x1

    aput-object v23, v31, v32

    const/16 v32, 0x2

    aput-object v3, v31, v32

    invoke-virtual/range {v29 .. v31}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    goto/16 :goto_1ac

    .line 270
    .end local v3    # "description":Ljava/lang/String;
    .end local v22    # "tag":Lcom/drew/metadata/Tag;
    .end local v23    # "tagName":Ljava/lang/String;
    :cond_27e
    invoke-virtual {v4}, Lcom/drew/metadata/Directory;->getErrors()Ljava/lang/Iterable;

    move-result-object v29

    invoke-interface/range {v29 .. v29}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_286
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v29

    if-eqz v29, :cond_194

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 271
    .local v7, "error":Ljava/lang/String;
    sget-object v29, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "ERROR: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_286

    .line 274
    .end local v4    # "directory":Lcom/drew/metadata/Directory;
    .end local v5    # "directoryName":Ljava/lang/String;
    .end local v7    # "error":Ljava/lang/String;
    .end local v14    # "i$":Ljava/util/Iterator;
    :cond_2ad
    move-object/from16 v0, p0

    array-length v0, v0

    move/from16 v29, v0

    const/16 v30, 0x1

    move/from16 v0, v29

    move/from16 v1, v30

    if-le v0, v1, :cond_7e

    if-eqz v24, :cond_7e

    .line 275
    const-class v29, Lcom/drew/metadata/exif/ExifThumbnailDirectory;

    move-object/from16 v0, v17

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lcom/drew/metadata/Metadata;->getFirstDirectoryOfType(Ljava/lang/Class;)Lcom/drew/metadata/Directory;

    move-result-object v4

    check-cast v4, Lcom/drew/metadata/exif/ExifThumbnailDirectory;

    .line 276
    .local v4, "directory":Lcom/drew/metadata/exif/ExifThumbnailDirectory;
    if-eqz v4, :cond_2f9

    invoke-virtual {v4}, Lcom/drew/metadata/exif/ExifThumbnailDirectory;->hasThumbnailData()Z

    move-result v29

    if-eqz v29, :cond_2f9

    .line 277
    sget-object v29, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v30, "Writing thumbnail..."

    invoke-virtual/range {v29 .. v30}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 278
    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v30, 0x0

    aget-object v30, p0, v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    const-string v30, ".thumb.jpg"

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v4, v0}, Lcom/drew/metadata/exif/ExifThumbnailDirectory;->writeThumbnail(Ljava/lang/String;)V

    goto/16 :goto_7e

    .line 280
    :cond_2f9
    sget-object v29, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v30, "No thumbnail data exists in this image"

    invoke-virtual/range {v29 .. v30}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_7e

    .line 284
    .end local v4    # "directory":Lcom/drew/metadata/exif/ExifThumbnailDirectory;
    .end local v9    # "file":Ljava/io/File;
    .end local v11    # "filePath":Ljava/lang/String;
    .end local v17    # "metadata":Lcom/drew/metadata/Metadata;
    .end local v20    # "startTime":J
    .end local v25    # "took":J
    :cond_302
    return-void
.end method

.method public static readMetadata(Ljava/io/File;)Lcom/drew/metadata/Metadata;
    .registers 5
    .param p0, "file"    # Ljava/io/File;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/drew/imaging/ImageProcessingException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 159
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 162
    .local v0, "inputStream":Ljava/io/InputStream;
    :try_start_5
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lcom/drew/imaging/ImageMetadataReader;->readMetadata(Ljava/io/InputStream;J)Lcom/drew/metadata/Metadata;
    :try_end_c
    .catchall {:try_start_5 .. :try_end_c} :catchall_19

    move-result-object v1

    .line 164
    .local v1, "metadata":Lcom/drew/metadata/Metadata;
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 166
    new-instance v2, Lcom/drew/metadata/file/FileMetadataReader;

    invoke-direct {v2}, Lcom/drew/metadata/file/FileMetadataReader;-><init>()V

    invoke-virtual {v2, p0, v1}, Lcom/drew/metadata/file/FileMetadataReader;->read(Ljava/io/File;Lcom/drew/metadata/Metadata;)V

    .line 167
    return-object v1

    .line 164
    .end local v1    # "metadata":Lcom/drew/metadata/Metadata;
    :catchall_19
    move-exception v2

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    throw v2
.end method

.method public static readMetadata(Ljava/io/InputStream;)Lcom/drew/metadata/Metadata;
    .registers 3
    .param p0, "inputStream"    # Ljava/io/InputStream;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/drew/imaging/ImageProcessingException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 90
    const-wide/16 v0, -0x1

    invoke-static {p0, v0, v1}, Lcom/drew/imaging/ImageMetadataReader;->readMetadata(Ljava/io/InputStream;J)Lcom/drew/metadata/Metadata;

    move-result-object v0

    return-object v0
.end method

.method public static readMetadata(Ljava/io/InputStream;J)Lcom/drew/metadata/Metadata;
    .registers 7
    .param p0, "inputStream"    # Ljava/io/InputStream;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p1, "streamLength"    # J
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/drew/imaging/ImageProcessingException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    instance-of v2, p0, Ljava/io/BufferedInputStream;

    if-eqz v2, :cond_14

    check-cast p0, Ljava/io/BufferedInputStream;

    .end local p0    # "inputStream":Ljava/io/InputStream;
    move-object v0, p0

    .line 109
    .local v0, "bufferedInputStream":Ljava/io/BufferedInputStream;
    :goto_7
    invoke-static {v0}, Lcom/drew/imaging/FileTypeDetector;->detectFileType(Ljava/io/BufferedInputStream;)Lcom/drew/imaging/FileType;

    move-result-object v1

    .line 111
    .local v1, "fileType":Lcom/drew/imaging/FileType;
    sget-object v2, Lcom/drew/imaging/FileType;->Jpeg:Lcom/drew/imaging/FileType;

    if-ne v1, v2, :cond_1a

    .line 112
    invoke-static {v0}, Lcom/drew/imaging/jpeg/JpegMetadataReader;->readMetadata(Ljava/io/InputStream;)Lcom/drew/metadata/Metadata;

    move-result-object v2

    .line 144
    :goto_13
    return-object v2

    .line 105
    .end local v0    # "bufferedInputStream":Ljava/io/BufferedInputStream;
    .end local v1    # "fileType":Lcom/drew/imaging/FileType;
    .restart local p0    # "inputStream":Ljava/io/InputStream;
    :cond_14
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, p0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_7

    .line 114
    .end local p0    # "inputStream":Ljava/io/InputStream;
    .restart local v0    # "bufferedInputStream":Ljava/io/BufferedInputStream;
    .restart local v1    # "fileType":Lcom/drew/imaging/FileType;
    :cond_1a
    sget-object v2, Lcom/drew/imaging/FileType;->Tiff:Lcom/drew/imaging/FileType;

    if-eq v1, v2, :cond_32

    sget-object v2, Lcom/drew/imaging/FileType;->Arw:Lcom/drew/imaging/FileType;

    if-eq v1, v2, :cond_32

    sget-object v2, Lcom/drew/imaging/FileType;->Cr2:Lcom/drew/imaging/FileType;

    if-eq v1, v2, :cond_32

    sget-object v2, Lcom/drew/imaging/FileType;->Nef:Lcom/drew/imaging/FileType;

    if-eq v1, v2, :cond_32

    sget-object v2, Lcom/drew/imaging/FileType;->Orf:Lcom/drew/imaging/FileType;

    if-eq v1, v2, :cond_32

    sget-object v2, Lcom/drew/imaging/FileType;->Rw2:Lcom/drew/imaging/FileType;

    if-ne v1, v2, :cond_3e

    .line 120
    :cond_32
    new-instance v2, Lcom/drew/lang/RandomAccessStreamReader;

    const/16 v3, 0x800

    invoke-direct {v2, v0, v3, p1, p2}, Lcom/drew/lang/RandomAccessStreamReader;-><init>(Ljava/io/InputStream;IJ)V

    invoke-static {v2}, Lcom/drew/imaging/tiff/TiffMetadataReader;->readMetadata(Lcom/drew/lang/RandomAccessReader;)Lcom/drew/metadata/Metadata;

    move-result-object v2

    goto :goto_13

    .line 122
    :cond_3e
    sget-object v2, Lcom/drew/imaging/FileType;->Psd:Lcom/drew/imaging/FileType;

    if-ne v1, v2, :cond_47

    .line 123
    invoke-static {v0}, Lcom/drew/imaging/psd/PsdMetadataReader;->readMetadata(Ljava/io/InputStream;)Lcom/drew/metadata/Metadata;

    move-result-object v2

    goto :goto_13

    .line 125
    :cond_47
    sget-object v2, Lcom/drew/imaging/FileType;->Png:Lcom/drew/imaging/FileType;

    if-ne v1, v2, :cond_50

    .line 126
    invoke-static {v0}, Lcom/drew/imaging/png/PngMetadataReader;->readMetadata(Ljava/io/InputStream;)Lcom/drew/metadata/Metadata;

    move-result-object v2

    goto :goto_13

    .line 128
    :cond_50
    sget-object v2, Lcom/drew/imaging/FileType;->Bmp:Lcom/drew/imaging/FileType;

    if-ne v1, v2, :cond_59

    .line 129
    invoke-static {v0}, Lcom/drew/imaging/bmp/BmpMetadataReader;->readMetadata(Ljava/io/InputStream;)Lcom/drew/metadata/Metadata;

    move-result-object v2

    goto :goto_13

    .line 131
    :cond_59
    sget-object v2, Lcom/drew/imaging/FileType;->Gif:Lcom/drew/imaging/FileType;

    if-ne v1, v2, :cond_62

    .line 132
    invoke-static {v0}, Lcom/drew/imaging/gif/GifMetadataReader;->readMetadata(Ljava/io/InputStream;)Lcom/drew/metadata/Metadata;

    move-result-object v2

    goto :goto_13

    .line 134
    :cond_62
    sget-object v2, Lcom/drew/imaging/FileType;->Ico:Lcom/drew/imaging/FileType;

    if-ne v1, v2, :cond_6b

    .line 135
    invoke-static {v0}, Lcom/drew/imaging/ico/IcoMetadataReader;->readMetadata(Ljava/io/InputStream;)Lcom/drew/metadata/Metadata;

    move-result-object v2

    goto :goto_13

    .line 137
    :cond_6b
    sget-object v2, Lcom/drew/imaging/FileType;->Pcx:Lcom/drew/imaging/FileType;

    if-ne v1, v2, :cond_74

    .line 138
    invoke-static {v0}, Lcom/drew/imaging/pcx/PcxMetadataReader;->readMetadata(Ljava/io/InputStream;)Lcom/drew/metadata/Metadata;

    move-result-object v2

    goto :goto_13

    .line 140
    :cond_74
    sget-object v2, Lcom/drew/imaging/FileType;->Riff:Lcom/drew/imaging/FileType;

    if-ne v1, v2, :cond_7d

    .line 141
    invoke-static {v0}, Lcom/drew/imaging/webp/WebpMetadataReader;->readMetadata(Ljava/io/InputStream;)Lcom/drew/metadata/Metadata;

    move-result-object v2

    goto :goto_13

    .line 143
    :cond_7d
    sget-object v2, Lcom/drew/imaging/FileType;->Raf:Lcom/drew/imaging/FileType;

    if-ne v1, v2, :cond_86

    .line 144
    invoke-static {v0}, Lcom/drew/imaging/raf/RafMetadataReader;->readMetadata(Ljava/io/InputStream;)Lcom/drew/metadata/Metadata;

    move-result-object v2

    goto :goto_13

    .line 146
    :cond_86
    new-instance v2, Lcom/drew/imaging/ImageProcessingException;

    const-string v3, "File format is not supported"

    invoke-direct {v2, v3}, Lcom/drew/imaging/ImageProcessingException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
