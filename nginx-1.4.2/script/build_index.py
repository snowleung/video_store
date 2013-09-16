#coding:utf-8

import os
from jinja2 import Template

page_count = 12 #how many item in a page
temp_file_path = "D:\\websites\\nginx-1.4.2\\template\\bt.htm"
output_file_dir = "D:\\websites\\nginx-1.4.2\\html"
videos_dir = "D:\\websites\\nginx-1.4.2\\static\\videos\\"
ext_filter = ['.mp4','.m4v']

def build_index(video_list):
    pages_count = calc_page(video_list)
    pre_i = 0
    if pages_count == 1:
        build_html_file(video_list, pages_count, 1)
        return
    for p in range(1,pages_count +1):       # generate index page
        next_i = p * page_count
        page_videos = video_list[pre_i:next_i]
        pre_i = next_i
        build_html_file(page_videos, pages_count, p)

def build_html_file(videos,pages,current_page):
    f = open(temp_file_path,"r")
    tmp = f.read()
    tmp = tmp.decode('utf-8')
    t = Template(tmp)
    s = t.render(videos = videos,pages = pages)
    s = s.encode('utf-8')
    f.close()
    fw = open(os.path.join(output_file_dir,str(current_page)+".html"),"w")
    fw.write(s)
    fw.close()
    print "finish generate html"

def calc_page(video_list):
    p_len = len(video_list)
    print "data count is : %i" % p_len
    pages_count = 1
    if page_count < p_len:#more than one page
        pages_count = p_len / page_count
        if p_len % page_count != 0 :
            pages_count = pages_count + 1 # the last page
    print "this has %i page" % pages_count
    return pages_count

class Video_data:
    path = ""
    display_name = ""

if __name__ == "__main__":
    videos = []
    for r, d, fs in os.walk(videos_dir):
        for f in fs:
            if os.path.splitext(f)[1] not in ext_filter:
                continue
            v = Video_data()
            p = r.replace(videos_dir,"")
            v.path = os.path.join(p,f)
            v.display_name = f
            videos.append(v)
#    print videos
    build_index(videos)
    print "finish"
