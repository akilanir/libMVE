package com.drew.tools;

import com.drew.imaging.ImageMetadataReader;
import com.drew.imaging.jpeg.JpegProcessingException;
import com.drew.lang.StringUtil;
import com.drew.lang.annotations.NotNull;
import com.drew.lang.annotations.Nullable;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.Tag;
import com.drew.metadata.exif.ExifDirectoryBase;
import com.drew.metadata.exif.ExifIFD0Directory;
import com.drew.metadata.exif.ExifSubIFDDirectory;
import com.drew.metadata.exif.ExifThumbnailDirectory;
import com.drew.metadata.file.FileMetadataDirectory;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* loaded from: metadata-extractor-2.9.1.jar:com/drew/tools/ProcessAllImagesInFolderUtility.class */
public class ProcessAllImagesInFolderUtility {

    /* loaded from: metadata-extractor-2.9.1.jar:com/drew/tools/ProcessAllImagesInFolderUtility$FileHandler.class */
    interface FileHandler {
        void onStartingDirectory(@NotNull File file);

        boolean shouldProcess(@NotNull File file);

        void onBeforeExtraction(@NotNull File file, @NotNull PrintStream printStream, @NotNull String str);

        void onExtractionSuccess(@NotNull File file, @NotNull Metadata metadata, @NotNull String str, @NotNull PrintStream printStream);

        void onExtractionError(@NotNull File file, @NotNull Throwable th, @NotNull PrintStream printStream);

        void onScanCompleted(@NotNull PrintStream printStream);
    }

    public static void main(String[] args) throws IOException, JpegProcessingException {
        List<String> directories = new ArrayList<>();
        FileHandler handler = null;
        PrintStream log = System.out;
        int i = 0;
        while (i < args.length) {
            String arg = args[i];
            if (arg.equalsIgnoreCase("--text")) {
                handler = new TextFileOutputHandler();
            } else if (arg.equalsIgnoreCase("--markdown")) {
                handler = new MarkdownTableOutputHandler();
            } else if (arg.equalsIgnoreCase("--unknown")) {
                handler = new UnknownTagHandler();
            } else if (arg.equalsIgnoreCase("--log-file")) {
                if (i == args.length - 1) {
                    printUsage();
                    System.exit(1);
                }
                i++;
                log = new PrintStream((OutputStream) new FileOutputStream(args[i], false), true);
            } else {
                directories.add(arg);
            }
            i++;
        }
        if (directories.isEmpty()) {
            System.err.println("Expects one or more directories as arguments.");
            printUsage();
            System.exit(1);
        }
        if (handler == null) {
            handler = new BasicFileHandler();
        }
        long start = System.nanoTime();
        for (String directory : directories) {
            processDirectory(new File(directory), handler, "", log);
        }
        handler.onScanCompleted(log);
        System.out.println(String.format("Completed in %d ms", Long.valueOf((System.nanoTime() - start) / 1000000)));
        if (log != System.out) {
            log.close();
        }
    }

    private static void printUsage() {
        System.out.println("Usage:");
        System.out.println();
        System.out.println("  java com.drew.tools.ProcessAllImagesInFolderUtility [--text|--markdown|--unknown] [--log-file <file-name>]");
    }

    private static void processDirectory(@NotNull File path, @NotNull FileHandler handler, @NotNull String relativePath, PrintStream log) {
        handler.onStartingDirectory(path);
        String[] pathItems = path.list();
        if (pathItems == null) {
            return;
        }
        Arrays.sort(pathItems);
        for (String pathItem : pathItems) {
            File file = new File(path, pathItem);
            if (file.isDirectory()) {
                processDirectory(file, handler, relativePath.length() == 0 ? pathItem : relativePath + "/" + pathItem, log);
            } else if (handler.shouldProcess(file)) {
                handler.onBeforeExtraction(file, log, relativePath);
                try {
                    Metadata metadata = ImageMetadataReader.readMetadata(file);
                    handler.onExtractionSuccess(file, metadata, relativePath, log);
                } catch (Throwable t) {
                    handler.onExtractionError(file, t, log);
                }
            }
        }
    }

    /* loaded from: metadata-extractor-2.9.1.jar:com/drew/tools/ProcessAllImagesInFolderUtility$FileHandlerBase.class */
    static abstract class FileHandlerBase implements FileHandler {
        private final Set<String> _supportedExtensions = new HashSet(Arrays.asList("jpg", "jpeg", "png", "gif", "bmp", "ico", "webp", "pcx", "ai", "eps", "nef", "crw", "cr2", "orf", "arw", "raf", "srw", "x3f", "rw2", "rwl", "tif", "tiff", "psd", "dng"));
        private int _processedFileCount = 0;
        private int _exceptionCount = 0;
        private int _errorCount = 0;
        private long _processedByteCount = 0;

        FileHandlerBase() {
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public void onStartingDirectory(@NotNull File directoryPath) {
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public boolean shouldProcess(@NotNull File file) {
            String extension = getExtension(file);
            return extension != null && this._supportedExtensions.contains(extension.toLowerCase());
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public void onBeforeExtraction(@NotNull File file, @NotNull PrintStream log, @NotNull String relativePath) {
            this._processedFileCount++;
            this._processedByteCount += file.length();
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public void onExtractionError(@NotNull File file, @NotNull Throwable throwable, @NotNull PrintStream log) {
            this._exceptionCount++;
            log.printf("\t[%s] %s\n", throwable.getClass().getName(), throwable.getMessage());
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public void onExtractionSuccess(@NotNull File file, @NotNull Metadata metadata, @NotNull String relativePath, @NotNull PrintStream log) {
            if (metadata.hasErrors()) {
                log.print(file);
                log.print('\n');
                for (Directory directory : metadata.getDirectories()) {
                    if (directory.hasErrors()) {
                        for (String error : directory.getErrors()) {
                            log.printf("\t[%s] %s\n", directory.getName(), error);
                            this._errorCount++;
                        }
                    }
                }
            }
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public void onScanCompleted(@NotNull PrintStream log) {
            if (this._processedFileCount > 0) {
                log.print(String.format("Processed %,d files (%,d bytes) with %,d exceptions and %,d file errors\n", Integer.valueOf(this._processedFileCount), Long.valueOf(this._processedByteCount), Integer.valueOf(this._exceptionCount), Integer.valueOf(this._errorCount)));
            }
        }

        @Nullable
        protected String getExtension(@NotNull File file) {
            String fileName = file.getName();
            int i = fileName.lastIndexOf(46);
            if (i == -1 || i == fileName.length() - 1) {
                return null;
            }
            return fileName.substring(i + 1);
        }
    }

    /* loaded from: metadata-extractor-2.9.1.jar:com/drew/tools/ProcessAllImagesInFolderUtility$TextFileOutputHandler.class */
    static class TextFileOutputHandler extends FileHandlerBase {
        private static final String NEW_LINE = "\n";

        TextFileOutputHandler() {
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandlerBase, com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public void onStartingDirectory(@NotNull File directoryPath) {
            super.onStartingDirectory(directoryPath);
            File metadataDirectory = new File(directoryPath + "/metadata");
            if (metadataDirectory.exists()) {
                deleteRecursively(metadataDirectory);
            }
        }

        private static void deleteRecursively(File directory) {
            if (!directory.isDirectory()) {
                throw new IllegalArgumentException("Must be a directory.");
            }
            if (directory.exists()) {
                String[] arr$ = directory.list();
                for (String item : arr$) {
                    File file = new File(item);
                    if (file.isDirectory()) {
                        deleteRecursively(file);
                    } else {
                        file.delete();
                    }
                }
            }
            directory.delete();
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandlerBase, com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public void onBeforeExtraction(@NotNull File file, @NotNull PrintStream log, @NotNull String relativePath) {
            super.onBeforeExtraction(file, log, relativePath);
            log.print(file.getAbsoluteFile());
            log.print(NEW_LINE);
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandlerBase, com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public void onExtractionSuccess(@NotNull File file, @NotNull Metadata metadata, @NotNull String relativePath, @NotNull PrintStream log) {
            super.onExtractionSuccess(file, metadata, relativePath, log);
            PrintWriter writer = null;
            try {
                try {
                    writer = openWriter(file);
                    if (metadata.hasErrors()) {
                        for (Directory directory : metadata.getDirectories()) {
                            if (directory.hasErrors()) {
                                for (String error : directory.getErrors()) {
                                    writer.format("[ERROR: %s] %s%s", directory.getName(), error, NEW_LINE);
                                }
                            }
                        }
                        writer.write(NEW_LINE);
                    }
                    for (Directory directory2 : metadata.getDirectories()) {
                        String directoryName = directory2.getName();
                        for (Tag tag : directory2.getTags()) {
                            String tagName = tag.getTagName();
                            String description = tag.getDescription();
                            if (description == null) {
                                description = "";
                            }
                            if ((directory2 instanceof FileMetadataDirectory) && tag.getTagType() == 3) {
                                description = "<omitted for regression testing as checkout dependent>";
                            }
                            writer.format("[%s - %s] %s = %s%s", directoryName, tag.getTagTypeHex(), tagName, description, NEW_LINE);
                        }
                        if (directory2.getTagCount() != 0) {
                            writer.write(NEW_LINE);
                        }
                    }
                    writeHierarchyLevel(metadata, writer, null, 0);
                    writer.write(NEW_LINE);
                    closeWriter(writer);
                } catch (Throwable th) {
                    closeWriter(writer);
                    throw th;
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        /* JADX WARN: Removed duplicated region for block: B:16:0x004d A[LOOP:1: B:14:0x0045->B:16:0x004d, LOOP_END] */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        private static void writeHierarchyLevel(@com.drew.lang.annotations.NotNull com.drew.metadata.Metadata r6, @com.drew.lang.annotations.NotNull java.io.PrintWriter r7, @com.drew.lang.annotations.Nullable com.drew.metadata.Directory r8, int r9) {
            /*
                r0 = 4
                r10 = r0
                r0 = r6
                java.lang.Iterable r0 = r0.getDirectories()
                java.util.Iterator r0 = r0.iterator()
                r11 = r0
            Le:
                r0 = r11
                boolean r0 = r0.hasNext()
                if (r0 == 0) goto L7b
                r0 = r11
                java.lang.Object r0 = r0.next()
                com.drew.metadata.Directory r0 = (com.drew.metadata.Directory) r0
                r12 = r0
                r0 = r8
                if (r0 != 0) goto L33
                r0 = r12
                com.drew.metadata.Directory r0 = r0.getParent()
                if (r0 == 0) goto L42
                goto Le
            L33:
                r0 = r8
                r1 = r12
                com.drew.metadata.Directory r1 = r1.getParent()
                boolean r0 = r0.equals(r1)
                if (r0 != 0) goto L42
                goto Le
            L42:
                r0 = 0
                r13 = r0
            L45:
                r0 = r13
                r1 = r9
                r2 = 4
                int r1 = r1 * r2
                if (r0 >= r1) goto L59
                r0 = r7
                r1 = 32
                r0.write(r1)
                int r13 = r13 + 1
                goto L45
            L59:
                r0 = r7
                java.lang.String r1 = "- "
                r0.write(r1)
                r0 = r7
                r1 = r12
                java.lang.String r1 = r1.getName()
                r0.write(r1)
                r0 = r7
                java.lang.String r1 = "\n"
                r0.write(r1)
                r0 = r6
                r1 = r7
                r2 = r12
                r3 = r9
                r4 = 1
                int r3 = r3 + r4
                writeHierarchyLevel(r0, r1, r2, r3)
                goto Le
            L7b:
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: com.drew.tools.ProcessAllImagesInFolderUtility.TextFileOutputHandler.writeHierarchyLevel(com.drew.metadata.Metadata, java.io.PrintWriter, com.drew.metadata.Directory, int):void");
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandlerBase, com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public void onExtractionError(@NotNull File file, @NotNull Throwable throwable, @NotNull PrintStream log) {
            super.onExtractionError(file, throwable, log);
            PrintWriter writer = null;
            try {
                try {
                    writer = openWriter(file);
                    writer.write("EXCEPTION: " + throwable.getMessage() + NEW_LINE);
                    writer.write(NEW_LINE);
                    closeWriter(writer);
                } catch (Throwable th) {
                    closeWriter(writer);
                    throw th;
                }
            } catch (IOException e) {
                log.printf("IO exception writing metadata file: %s%s", e.getMessage(), NEW_LINE);
            }
        }

        @NotNull
        private static PrintWriter openWriter(@NotNull File file) throws IOException {
            File metadataDir = new File(String.format("%s/metadata", file.getParent()));
            if (!metadataDir.exists()) {
                metadataDir.mkdir();
            }
            String outputPath = String.format("%s/metadata/%s.txt", file.getParent(), file.getName());
            Writer writer = new OutputStreamWriter(new FileOutputStream(outputPath), "UTF-8");
            writer.write("FILE: " + file.getName() + NEW_LINE);
            writer.write(NEW_LINE);
            return new PrintWriter(writer);
        }

        private static void closeWriter(@Nullable Writer writer) throws IOException {
            if (writer != null) {
                writer.write("Generated using metadata-extractor\n");
                writer.write("https://drewnoakes.com/code/exif/\n");
                writer.flush();
                writer.close();
            }
        }
    }

    /* loaded from: metadata-extractor-2.9.1.jar:com/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler.class */
    static class MarkdownTableOutputHandler extends FileHandlerBase {
        private final Map<String, String> _extensionEquivalence = new HashMap();
        private final Map<String, List<Row>> _rowListByExtension = new HashMap();

        /* loaded from: metadata-extractor-2.9.1.jar:com/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler$Row.class */
        class Row {
            final File file;
            final Metadata metadata;

            @NotNull
            final String relativePath;

            @Nullable
            private String manufacturer;

            @Nullable
            private String model;

            @Nullable
            private String exifVersion;

            @Nullable
            private String thumbnail;

            @Nullable
            private String makernote;

            Row(@NotNull File file, @NotNull Metadata metadata, @NotNull String relativePath) {
                this.file = file;
                this.metadata = metadata;
                this.relativePath = relativePath;
                ExifIFD0Directory ifd0Dir = (ExifIFD0Directory) metadata.getFirstDirectoryOfType(ExifIFD0Directory.class);
                ExifSubIFDDirectory subIfdDir = (ExifSubIFDDirectory) metadata.getFirstDirectoryOfType(ExifSubIFDDirectory.class);
                ExifThumbnailDirectory thumbDir = (ExifThumbnailDirectory) metadata.getFirstDirectoryOfType(ExifThumbnailDirectory.class);
                if (ifd0Dir != null) {
                    this.manufacturer = ifd0Dir.getDescription(ExifDirectoryBase.TAG_MAKE);
                    this.model = ifd0Dir.getDescription(ExifDirectoryBase.TAG_MODEL);
                }
                boolean hasMakernoteData = false;
                if (subIfdDir != null) {
                    this.exifVersion = subIfdDir.getDescription(ExifDirectoryBase.TAG_EXIF_VERSION);
                    hasMakernoteData = subIfdDir.containsTag(ExifDirectoryBase.TAG_MAKERNOTE);
                }
                if (thumbDir != null) {
                    Integer width = thumbDir.getInteger(256);
                    Integer height = thumbDir.getInteger(257);
                    this.thumbnail = (width == null || height == null) ? "Yes" : String.format("Yes (%s x %s)", width, height);
                }
                for (Directory directory : metadata.getDirectories()) {
                    if (directory.getClass().getName().contains("Makernote")) {
                        this.makernote = directory.getName().replace("Makernote", "").trim();
                    }
                }
                if (this.makernote == null) {
                    this.makernote = hasMakernoteData ? "(Unknown)" : "N/A";
                }
            }
        }

        public MarkdownTableOutputHandler() {
            this._extensionEquivalence.put("jpeg", "jpg");
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandlerBase, com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public void onExtractionSuccess(@NotNull File file, @NotNull Metadata metadata, @NotNull String relativePath, @NotNull PrintStream log) {
            super.onExtractionSuccess(file, metadata, relativePath, log);
            String extension = getExtension(file);
            if (extension == null) {
                return;
            }
            String extension2 = extension.toLowerCase();
            if (this._extensionEquivalence.containsKey(extension2)) {
                extension2 = this._extensionEquivalence.get(extension2);
            }
            List<Row> list = this._rowListByExtension.get(extension2);
            if (list == null) {
                list = new ArrayList();
                this._rowListByExtension.put(extension2, list);
            }
            list.add(new Row(file, metadata, relativePath));
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandlerBase, com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public void onScanCompleted(@NotNull PrintStream log) {
            super.onScanCompleted(log);
            OutputStream outputStream = null;
            PrintStream stream = null;
            try {
                try {
                    outputStream = new FileOutputStream("../wiki/ImageDatabaseSummary.md", false);
                    stream = new PrintStream(outputStream, false);
                    writeOutput(stream);
                    stream.flush();
                    if (stream != null) {
                        stream.close();
                    }
                    if (outputStream != null) {
                        try {
                            outputStream.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                } catch (IOException e2) {
                    e2.printStackTrace();
                    if (stream != null) {
                        stream.close();
                    }
                    if (outputStream != null) {
                        try {
                            outputStream.close();
                        } catch (IOException e3) {
                            e3.printStackTrace();
                        }
                    }
                }
            } catch (Throwable th) {
                if (stream != null) {
                    stream.close();
                }
                if (outputStream != null) {
                    try {
                        outputStream.close();
                    } catch (IOException e4) {
                        e4.printStackTrace();
                    }
                }
                throw th;
            }
        }

        private void writeOutput(@NotNull PrintStream stream) throws IOException {
            Writer writer = new OutputStreamWriter(stream);
            writer.write("# Image Database Summary\n\n");
            for (String extension : this._rowListByExtension.keySet()) {
                writer.write("## " + extension.toUpperCase() + " Files\n\n");
                writer.write("File|Manufacturer|Model|Dir Count|Exif?|Makernote|Thumbnail|All Data\n");
                writer.write("----|------------|-----|---------|-----|---------|---------|--------\n");
                List<Row> rows = this._rowListByExtension.get(extension);
                Collections.sort(rows, new Comparator<Row>() { // from class: com.drew.tools.ProcessAllImagesInFolderUtility.MarkdownTableOutputHandler.1
                    @Override // java.util.Comparator
                    public int compare(Row o1, Row o2) {
                        int c1 = StringUtil.compare(o1.manufacturer, o2.manufacturer);
                        return c1 != 0 ? c1 : StringUtil.compare(o1.model, o2.model);
                    }
                });
                for (Row row : rows) {
                    Object[] objArr = new Object[11];
                    objArr[0] = row.file.getName();
                    objArr[1] = row.relativePath;
                    objArr[2] = StringUtil.urlEncode(row.file.getName());
                    objArr[3] = row.manufacturer == null ? "" : row.manufacturer;
                    objArr[4] = row.model == null ? "" : row.model;
                    objArr[5] = Integer.valueOf(row.metadata.getDirectoryCount());
                    objArr[6] = row.exifVersion == null ? "" : row.exifVersion;
                    objArr[7] = row.makernote == null ? "" : row.makernote;
                    objArr[8] = row.thumbnail == null ? "" : row.thumbnail;
                    objArr[9] = row.relativePath;
                    objArr[10] = StringUtil.urlEncode(row.file.getName()).toLowerCase();
                    writer.write(String.format("[%s](https://raw.githubusercontent.com/drewnoakes/metadata-extractor-images/master/%s/%s)|%s|%s|%d|%s|%s|%s|[metadata](https://raw.githubusercontent.com/drewnoakes/metadata-extractor-images/master/%s/metadata/%s.txt)\n", objArr));
                }
                writer.write(10);
            }
            writer.flush();
        }
    }

    /* loaded from: metadata-extractor-2.9.1.jar:com/drew/tools/ProcessAllImagesInFolderUtility$UnknownTagHandler.class */
    static class UnknownTagHandler extends FileHandlerBase {
        private HashMap<String, HashMap<Integer, Integer>> _occurrenceCountByTagByDirectory = new HashMap<>();

        UnknownTagHandler() {
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandlerBase, com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public void onExtractionSuccess(@NotNull File file, @NotNull Metadata metadata, @NotNull String relativePath, @NotNull PrintStream log) {
            super.onExtractionSuccess(file, metadata, relativePath, log);
            for (Directory directory : metadata.getDirectories()) {
                for (Tag tag : directory.getTags()) {
                    if (!tag.hasTagName()) {
                        HashMap<Integer, Integer> occurrenceCountByTag = this._occurrenceCountByTagByDirectory.get(directory.getName());
                        if (occurrenceCountByTag == null) {
                            occurrenceCountByTag = new HashMap<>();
                            this._occurrenceCountByTagByDirectory.put(directory.getName(), occurrenceCountByTag);
                        }
                        Integer count = occurrenceCountByTag.get(Integer.valueOf(tag.getTagType()));
                        if (count == null) {
                            count = 0;
                            occurrenceCountByTag.put(Integer.valueOf(tag.getTagType()), 0);
                        }
                        occurrenceCountByTag.put(Integer.valueOf(tag.getTagType()), Integer.valueOf(count.intValue() + 1));
                    }
                }
            }
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandlerBase, com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public void onScanCompleted(@NotNull PrintStream log) {
            super.onScanCompleted(log);
            for (Map.Entry<String, HashMap<Integer, Integer>> pair1 : this._occurrenceCountByTagByDirectory.entrySet()) {
                String directoryName = pair1.getKey();
                List<Map.Entry<Integer, Integer>> counts = new ArrayList<>(pair1.getValue().entrySet());
                Collections.sort(counts, new Comparator<Map.Entry<Integer, Integer>>() { // from class: com.drew.tools.ProcessAllImagesInFolderUtility.UnknownTagHandler.1
                    @Override // java.util.Comparator
                    public int compare(Map.Entry<Integer, Integer> o1, Map.Entry<Integer, Integer> o2) {
                        return o2.getValue().compareTo(o1.getValue());
                    }
                });
                for (Map.Entry<Integer, Integer> pair2 : counts) {
                    Integer tagType = pair2.getKey();
                    Integer count = pair2.getValue();
                    log.format("%s, 0x%04X, %d\n", directoryName, tagType, count);
                }
            }
        }
    }

    /* loaded from: metadata-extractor-2.9.1.jar:com/drew/tools/ProcessAllImagesInFolderUtility$BasicFileHandler.class */
    static class BasicFileHandler extends FileHandlerBase {
        BasicFileHandler() {
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandlerBase, com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public void onExtractionSuccess(@NotNull File file, @NotNull Metadata metadata, @NotNull String relativePath, @NotNull PrintStream log) {
            super.onExtractionSuccess(file, metadata, relativePath, log);
            for (Directory directory : metadata.getDirectories()) {
                directory.getName();
                for (Tag tag : directory.getTags()) {
                    tag.getTagName();
                    tag.getDescription();
                }
            }
        }
    }
}
