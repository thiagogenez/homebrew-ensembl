# Copyright [2016] EMBL-European Bioinformatics Institute
# Licensed under the Apache License, Version 2.0 (the License);
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#     http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an AS IS BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class Ensc < Formula
  desc 'C bindings to Ensembl DBs and useful utils'
  homepage 'https://github.com/Ensembl/ensc-core'

  url 'https://github.com/Ensembl/ensc-core/archive/1.0.0.zip'
  sha256 'b05e9bc5950d07cd410b4eebf6354bb9ed3c8387afd97043109225a3db09a813'
  version '1.0.0'

  depends_on "ensembl/ensembl/mysql-client"
  depends_on "ensembl/ensembl/htslib" => :recommended
  depends_on "libconfig" => :recommended
  depends_on 'libtool'

  def install 
    chdir 'src'
    system './autogen.sh'
    system "./configure --prefix=#{prefix}"
    system 'make'
    system 'make install'
    mv "#{prefix}/bin/fastasplit", "#{prefix}/bin/fastasplit_random"
  end

  test do
    system 'indicate'
    system 'testdbc'
    system 'translate'
  end

end
