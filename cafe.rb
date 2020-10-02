
# Licensed under the Apache License, Version 2.0 (the License);
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#     http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an AS IS BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class Cafe < Formula
  desc "Computational Analysis of gene Family Evolution"
  homepage "http://sites.bio.indiana.edu/~hahnlab/Software.html"
  url "http://downloads.sourceforge.net/project/cafehahnlab/Previous_versions/cafehahnlab-code_v2.2.tgz"
  sha256 "82853f2df095417708182e4115666162c7cbf67f53778d6a6fa26c1ff58d7473"
  version "2.2"
  # Without "gcc", ld can't find libm and libpthread, e.g.
  # mathfunc.c:(.text+0x5afe): undefined reference to `__log_finite'
  # cafe_main.c:(.text+0x6f08): undefined reference to `pthread_create'
  depends_on 'gcc'

  def install
    cd 'cafe.2.2/cafe' do
      system 'make'
      mv 'bin/shell', 'bin/cafeshell'
      bin.install 'bin/cafeshell'
    end
  end
end
