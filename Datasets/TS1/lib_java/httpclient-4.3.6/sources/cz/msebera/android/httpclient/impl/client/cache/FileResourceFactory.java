package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.client.cache.Resource;
import cz.msebera.android.httpclient.client.cache.ResourceFactory;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/cache/FileResourceFactory.class */
public class FileResourceFactory implements ResourceFactory {
    private final File cacheDir;
    private final BasicIdGenerator idgen = new BasicIdGenerator();

    public FileResourceFactory(File cacheDir) {
        this.cacheDir = cacheDir;
    }

    private File generateUniqueCacheFile(String requestId) {
        StringBuilder buffer = new StringBuilder();
        this.idgen.generate(buffer);
        buffer.append('.');
        int len = Math.min(requestId.length(), 100);
        for (int i = 0; i < len; i++) {
            char ch = requestId.charAt(i);
            if (Character.isLetterOrDigit(ch) || ch == '.') {
                buffer.append(ch);
            } else {
                buffer.append('-');
            }
        }
        return new File(this.cacheDir, buffer.toString());
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x0049, code lost:
    
        r8.reached();
     */
    @Override // cz.msebera.android.httpclient.client.cache.ResourceFactory
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public cz.msebera.android.httpclient.client.cache.Resource generate(java.lang.String r6, java.io.InputStream r7, cz.msebera.android.httpclient.client.cache.InputLimit r8) throws java.io.IOException {
        /*
            r5 = this;
            r0 = r5
            r1 = r6
            java.io.File r0 = r0.generateUniqueCacheFile(r1)
            r9 = r0
            java.io.FileOutputStream r0 = new java.io.FileOutputStream
            r1 = r0
            r2 = r9
            r1.<init>(r2)
            r10 = r0
            r0 = 2048(0x800, float:2.87E-42)
            byte[] r0 = new byte[r0]     // Catch: java.lang.Throwable -> L58
            r11 = r0
            r0 = 0
            r12 = r0
        L1c:
            r0 = r7
            r1 = r11
            int r0 = r0.read(r1)     // Catch: java.lang.Throwable -> L58
            r1 = r0
            r14 = r1
            r1 = -1
            if (r0 == r1) goto L50
            r0 = r10
            r1 = r11
            r2 = 0
            r3 = r14
            r0.write(r1, r2, r3)     // Catch: java.lang.Throwable -> L58
            r0 = r12
            r1 = r14
            long r1 = (long) r1     // Catch: java.lang.Throwable -> L58
            long r0 = r0 + r1
            r12 = r0
            r0 = r8
            if (r0 == 0) goto L1c
            r0 = r12
            r1 = r8
            long r1 = r1.getValue()     // Catch: java.lang.Throwable -> L58
            int r0 = (r0 > r1 ? 1 : (r0 == r1 ? 0 : -1))
            if (r0 <= 0) goto L1c
            r0 = r8
            r0.reached()     // Catch: java.lang.Throwable -> L58
            goto L50
        L50:
            r0 = r10
            r0.close()
            goto L62
        L58:
            r15 = move-exception
            r0 = r10
            r0.close()
            r0 = r15
            throw r0
        L62:
            cz.msebera.android.httpclient.impl.client.cache.FileResource r0 = new cz.msebera.android.httpclient.impl.client.cache.FileResource
            r1 = r0
            r2 = r9
            r1.<init>(r2)
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: cz.msebera.android.httpclient.impl.client.cache.FileResourceFactory.generate(java.lang.String, java.io.InputStream, cz.msebera.android.httpclient.client.cache.InputLimit):cz.msebera.android.httpclient.client.cache.Resource");
    }

    @Override // cz.msebera.android.httpclient.client.cache.ResourceFactory
    public Resource copy(String requestId, Resource resource) throws IOException {
        File file = generateUniqueCacheFile(requestId);
        if (resource instanceof FileResource) {
            File src = ((FileResource) resource).getFile();
            IOUtils.copyFile(src, file);
        } else {
            FileOutputStream out = new FileOutputStream(file);
            IOUtils.copyAndClose(resource.getInputStream(), out);
        }
        return new FileResource(file);
    }
}
