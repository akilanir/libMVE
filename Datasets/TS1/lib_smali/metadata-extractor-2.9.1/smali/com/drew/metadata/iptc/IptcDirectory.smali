.class public Lcom/drew/metadata/iptc/IptcDirectory;
.super Lcom/drew/metadata/Directory;
.source "IptcDirectory.java"


# static fields
.field public static final TAG_ACTION_ADVISED:I = 0x22a

.field public static final TAG_APPLICATION_RECORD_VERSION:I = 0x200

.field public static final TAG_ARM_IDENTIFIER:I = 0x178

.field public static final TAG_ARM_VERSION:I = 0x17a

.field public static final TAG_AUDIO_DURATION:I = 0x299

.field public static final TAG_AUDIO_OUTCUE:I = 0x29a

.field public static final TAG_AUDIO_SAMPLING_RATE:I = 0x297

.field public static final TAG_AUDIO_SAMPLING_RESOLUTION:I = 0x298

.field public static final TAG_AUDIO_TYPE:I = 0x296

.field public static final TAG_BY_LINE:I = 0x250

.field public static final TAG_BY_LINE_TITLE:I = 0x255

.field public static final TAG_CAPTION:I = 0x278

.field public static final TAG_CAPTION_WRITER:I = 0x27a

.field public static final TAG_CATEGORY:I = 0x20f

.field public static final TAG_CITY:I = 0x25a

.field public static final TAG_CODED_CHARACTER_SET:I = 0x15a

.field public static final TAG_CONTACT:I = 0x276

.field public static final TAG_CONTENT_LOCATION_CODE:I = 0x21a

.field public static final TAG_CONTENT_LOCATION_NAME:I = 0x21b

.field public static final TAG_COPYRIGHT_NOTICE:I = 0x274

.field public static final TAG_COUNTRY_OR_PRIMARY_LOCATION_CODE:I = 0x264

.field public static final TAG_COUNTRY_OR_PRIMARY_LOCATION_NAME:I = 0x265

.field public static final TAG_CREDIT:I = 0x26e

.field public static final TAG_DATE_CREATED:I = 0x237

.field public static final TAG_DATE_SENT:I = 0x146

.field public static final TAG_DESTINATION:I = 0x105

.field public static final TAG_DIGITAL_DATE_CREATED:I = 0x23e

.field public static final TAG_DIGITAL_TIME_CREATED:I = 0x23f

.field public static final TAG_EDITORIAL_UPDATE:I = 0x208

.field public static final TAG_EDIT_STATUS:I = 0x207

.field public static final TAG_ENVELOPE_NUMBER:I = 0x128

.field public static final TAG_ENVELOPE_PRIORITY:I = 0x13c

.field public static final TAG_ENVELOPE_RECORD_VERSION:I = 0x100

.field public static final TAG_EXPIRATION_DATE:I = 0x225

.field public static final TAG_EXPIRATION_TIME:I = 0x226

.field public static final TAG_FILE_FORMAT:I = 0x114

.field public static final TAG_FILE_VERSION:I = 0x116

.field public static final TAG_FIXTURE_ID:I = 0x216

.field public static final TAG_HEADLINE:I = 0x269

.field public static final TAG_IMAGE_ORIENTATION:I = 0x283

.field public static final TAG_IMAGE_TYPE:I = 0x282

.field public static final TAG_JOB_ID:I = 0x2b8

.field public static final TAG_KEYWORDS:I = 0x219

.field public static final TAG_LANGUAGE_IDENTIFIER:I = 0x287

.field public static final TAG_LOCAL_CAPTION:I = 0x279

.field public static final TAG_MASTER_DOCUMENT_ID:I = 0x2b9

.field public static final TAG_OBJECT_ATTRIBUTE_REFERENCE:I = 0x204

.field public static final TAG_OBJECT_CYCLE:I = 0x24b

.field public static final TAG_OBJECT_NAME:I = 0x205

.field public static final TAG_OBJECT_PREVIEW_DATA:I = 0x2ca

.field public static final TAG_OBJECT_PREVIEW_FILE_FORMAT:I = 0x2c8

.field public static final TAG_OBJECT_PREVIEW_FILE_FORMAT_VERSION:I = 0x2c9

.field public static final TAG_OBJECT_TYPE_REFERENCE:I = 0x203

.field public static final TAG_ORIGINAL_TRANSMISSION_REFERENCE:I = 0x267

.field public static final TAG_ORIGINATING_PROGRAM:I = 0x241

.field public static final TAG_OWNER_ID:I = 0x2bc

.field public static final TAG_PRODUCT_ID:I = 0x132

.field public static final TAG_PROGRAM_VERSION:I = 0x246

.field public static final TAG_PROVINCE_OR_STATE:I = 0x25f

.field public static final TAG_RASTERIZED_CAPTION:I = 0x27d

.field public static final TAG_REFERENCE_DATE:I = 0x22f

.field public static final TAG_REFERENCE_NUMBER:I = 0x232

.field public static final TAG_REFERENCE_SERVICE:I = 0x22d

.field public static final TAG_RELEASE_DATE:I = 0x21e

.field public static final TAG_RELEASE_TIME:I = 0x223

.field public static final TAG_SERVICE_ID:I = 0x11e

.field public static final TAG_SHORT_DOCUMENT_ID:I = 0x2ba

.field public static final TAG_SOURCE:I = 0x273

.field public static final TAG_SPECIAL_INSTRUCTIONS:I = 0x228

.field public static final TAG_SUBJECT_REFERENCE:I = 0x20c

.field public static final TAG_SUB_LOCATION:I = 0x25c

.field public static final TAG_SUPPLEMENTAL_CATEGORIES:I = 0x214

.field public static final TAG_TIME_CREATED:I = 0x23c

.field public static final TAG_TIME_SENT:I = 0x150

.field public static final TAG_UNIQUE_DOCUMENT_ID:I = 0x2bb

.field public static final TAG_UNIQUE_OBJECT_NAME:I = 0x164

.field public static final TAG_URGENCY:I = 0x20a

.field protected static final _tagNameMap:Ljava/util/HashMap;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 127
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    .line 131
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x100

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Enveloped Record Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x105

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Destination"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x114

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "File Format"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x116

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "File Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x11e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Service Identifier"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x128

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Envelope Number"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x132

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Product Identifier"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x13c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Envelope Priority"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x146

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Date Sent"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x150

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Time Sent"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x15a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Coded Character Set"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x164

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Unique Object Name"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x178

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "ARM Identifier"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x17a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "ARM Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x200

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Application Record Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x203

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Object Type Reference"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x204

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Object Attribute Reference"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x205

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Object Name"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x207

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Edit Status"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x208

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Editorial Update"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x20a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Urgency"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x20c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Subject Reference"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x20f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Category"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x214

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Supplemental Category(s)"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x216

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Fixture Identifier"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x219

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Keywords"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x21a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Content Location Code"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x21b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Content Location Name"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x21e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Release Date"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x223

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Release Time"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x225

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Expiration Date"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x226

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Expiration Time"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x228

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Special Instructions"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x22a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Action Advised"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x22d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Reference Service"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x22f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Reference Date"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x232

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Reference Number"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x237

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Date Created"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x23c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Time Created"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x23e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Digital Date Created"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x23f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Digital Time Created"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x241

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Originating Program"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x246

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Program Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x24b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Object Cycle"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x250

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "By-line"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x255

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "By-line Title"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x25a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "City"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x25c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Sub-location"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x25f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Province/State"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x264

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Country/Primary Location Code"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x265

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Country/Primary Location Name"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x267

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Original Transmission Reference"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x269

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Headline"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x26e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Credit"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x273

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Source"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x274

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Copyright Notice"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x276

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Contact"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x278

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Caption/Abstract"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x279

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Local Caption"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x27a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Caption Writer/Editor"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x27d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Rasterized Caption"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x282

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Image Type"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x283

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Image Orientation"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x287

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Language Identifier"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x296

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Audio Type"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x297

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Audio Sampling Rate"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x298

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Audio Sampling Resolution"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x299

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Audio Duration"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x29a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Audio Outcue"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2b8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Job Identifier"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2b9

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Master Document Identifier"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2ba

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Short Document Identifier"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2bb

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Unique Document Identifier"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2bc

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Owner Identifier"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2c8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Object Data Preview File Format"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2c9

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Object Data Preview File Format Version"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    const/16 v1, 0x2ca

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Object Data Preview Data"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 214
    invoke-direct {p0}, Lcom/drew/metadata/Directory;-><init>()V

    .line 215
    new-instance v0, Lcom/drew/metadata/iptc/IptcDescriptor;

    invoke-direct {v0, p0}, Lcom/drew/metadata/iptc/IptcDescriptor;-><init>(Lcom/drew/metadata/iptc/IptcDirectory;)V

    invoke-virtual {p0, v0}, Lcom/drew/metadata/iptc/IptcDirectory;->setDescriptor(Lcom/drew/metadata/TagDescriptor;)V

    .line 216
    return-void
.end method

.method private getDate(II)Ljava/util/Date;
    .registers 9
    .param p1, "dateTagType"    # I
    .param p2, "timeTagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 303
    invoke-virtual {p0, p1}, Lcom/drew/metadata/iptc/IptcDirectory;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 304
    .local v0, "date":Ljava/lang/String;
    invoke-virtual {p0, p2}, Lcom/drew/metadata/iptc/IptcDirectory;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 306
    .local v3, "time":Ljava/lang/String;
    if-nez v0, :cond_c

    .line 315
    :cond_b
    :goto_b
    return-object v4

    .line 308
    :cond_c
    if-eqz v3, :cond_b

    .line 312
    :try_start_e
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v5, "yyyyMMddHHmmssZ"

    invoke-direct {v2, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 313
    .local v2, "parser":Ljava/text/DateFormat;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_29
    .catch Ljava/text/ParseException; {:try_start_e .. :try_end_29} :catch_2b

    move-result-object v4

    goto :goto_b

    .line 314
    .end local v2    # "parser":Ljava/text/DateFormat;
    :catch_2b
    move-exception v1

    .line 315
    .local v1, "e":Ljava/text/ParseException;
    goto :goto_b
.end method


# virtual methods
.method public getDateCreated()Ljava/util/Date;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 285
    const/16 v0, 0x237

    const/16 v1, 0x23c

    invoke-direct {p0, v0, v1}, Lcom/drew/metadata/iptc/IptcDirectory;->getDate(II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getDateSent()Ljava/util/Date;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 252
    const/16 v0, 0x146

    const/16 v1, 0x150

    invoke-direct {p0, v0, v1}, Lcom/drew/metadata/iptc/IptcDirectory;->getDate(II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getDigitalDateCreated()Ljava/util/Date;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 297
    const/16 v0, 0x23e

    const/16 v1, 0x23f

    invoke-direct {p0, v0, v1}, Lcom/drew/metadata/iptc/IptcDirectory;->getDate(II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getExpirationDate()Ljava/util/Date;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 274
    const/16 v0, 0x225

    const/16 v1, 0x226

    invoke-direct {p0, v0, v1}, Lcom/drew/metadata/iptc/IptcDirectory;->getDate(II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getKeywords()Ljava/util/List;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 238
    const/16 v1, 0x219

    invoke-virtual {p0, v1}, Lcom/drew/metadata/iptc/IptcDirectory;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    .line 239
    .local v0, "array":[Ljava/lang/String;
    if-nez v0, :cond_a

    .line 240
    const/4 v1, 0x0

    .line 241
    :goto_9
    return-object v1

    :cond_a
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    goto :goto_9
.end method

.method public getName()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 222
    const-string v0, "IPTC"

    return-object v0
.end method

.method public getReleaseDate()Ljava/util/Date;
    .registers 3
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 263
    const/16 v0, 0x21e

    const/16 v1, 0x223

    invoke-direct {p0, v0, v1}, Lcom/drew/metadata/iptc/IptcDirectory;->getDate(II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method protected getTagNameMap()Ljava/util/HashMap;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 229
    sget-object v0, Lcom/drew/metadata/iptc/IptcDirectory;->_tagNameMap:Ljava/util/HashMap;

    return-object v0
.end method
